BLOCKS = %w(B X D C N G R F J H V L Z).zip(%w(O K Q P A T E S W U I Y M))

def block_word?(word)
  !BLOCKS.any? do |block|
    word.upcase.include?(block[0]) &&
      word.upcase.include?(block[1])
  end
end

p block_word?('BATCH') == true
p block_word?('BUTCH') == false
p block_word?('jest') == true
