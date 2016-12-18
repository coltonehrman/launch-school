ADJECTIVES = %w(good new first last long great little own other old right big high different small large next early young important few public bad same able)

ADVERBS = %w(carefully correctly eagerly easily fast loudly patiently quickly quietly well always every never often rarely seldom sometimes usually)

NOUNS = %w(people history way art world information map two family government health system computer meat year thanks music person reading method)

VERBS = %w(are has get see need know would find take want does learn become come include thank provide create add understand consider choose develop)

text = File.read('madlib.txt')

def has_lib?(text)
  text.include?('%{adjective}') ||
    text.include?('%{adverb}')  ||
    text.include?('%{noun}')    ||
    text.include?('%{verb}')
end

def sub_libs(text)
  new_text = text.sub('%{adjective}', ADJECTIVES.sample)
  new_text = new_text.sub('%{adverb}', ADVERBS.sample)
  new_text = new_text.sub('%{noun}', NOUNS.sample)
  new_text.sub('%{verb}', VERBS.sample)
end

while has_lib?(text)
  text = sub_libs(text)
end

puts text
