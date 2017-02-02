require "sinatra"
require "sinatra/reloader"
require "tilt/erubis"

before do
  @contents = File.read('data/toc.txt').split("\n")
end

helpers do
  def in_paragraphs(text)
    text.split("\n\n").map.with_index do |p, index|
      %Q(<p id="#{index}">#{p}</p>)
    end.join
  end

  def highlight_words(text, words)
    text.gsub(words, "<strong>#{words}</strong>")
  end
end

get '/' do
  @title = "The Adventures of Sherlock Holmes"
  erb :home
end

get '/chapters/:chapter' do
  chapter = params[:chapter].to_i
  @title = "Chapter #{chapter}: #{@contents[chapter - 1]}"
  @chapter = File.read("data/chp#{chapter}.txt")

  erb :chapter
end

def each_paragraph(text)
  text.split("\n\n").each_with_index do |paragraph, i|
    yield(paragraph, i)
  end
end

def paragraphs_match(text, query)
  matches = []
  each_paragraph(text) do |paragraph, index|
    matches << { text: paragraph, id: index } if paragraph.include?(query)
  end
  return matches
end

def each_chapter
  @contents.each_with_index do |chapter, i|
    number = i + 1
    text = File.read("data/chp#{number}.txt")
    yield(chapter, number, text)
  end
end

def chapters_match(query)
  return nil unless query
  matches = []
  each_chapter do |chapter, number, text|
    paragraphs = paragraphs_match(text, query)
    matches << { chapter: chapter, number: number, paragraphs: paragraphs } unless paragraphs.empty?
  end
  return matches
end

get '/search' do
  @results = chapters_match(params[:query])
  erb :search
end

not_found do
  redirect '/'
end
