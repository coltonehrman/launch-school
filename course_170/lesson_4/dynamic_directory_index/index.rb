require "sinatra"
require "sinatra/reloader"
require "tilt/erubis"

files = []
Dir.glob('public/**/*') do |path|
  file = path.split('public/').last
  file_hash = { name: File.basename(file), path: file }
  files << file_hash unless File.directory?(path)
end

get '/' do
  @files = files.sort_by { |file| file[:name] }
  @files = @files.reverse if params[:sort] == 'desc'

  erb :files
end
