class TextAnalyzer
  def process
    open('text.txt') do |file|
      yield(file)
    end
  end
end

analyzer = TextAnalyzer.new
analyzer.process { |file| puts file.read.split(/\n+/).count }
analyzer.process { |file| puts file.readlines.count  }
analyzer.process { |file| puts file.read.split(/\s+/).count }
