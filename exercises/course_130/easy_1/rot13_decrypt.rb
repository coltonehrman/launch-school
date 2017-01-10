def decrypt_char(char)
  return char unless ('a'..'z').include?(char)
  first_13 = ('a'..'z').first(13)
  second_13 = ('a'..'z').last(13)
  uppercase = char.upcase == char
  char = char.downcase
  decrypted_char = first_13.include?(char) ?
    second_13[first_13.index(char)] :
    first_13[second_13.index(char)]
  uppercase ? decrypted_char.upcase :
    decrypted_char
end

def decrypt_word(word)
  word.chars.map do |char|
    decrypt_char(char)
  end.join('')
end

def decrypt_name(name)
  name.split.map { |word| decrypt_word(word) }.join(' ')
end

p decrypt 'Nqn Ybirynpr'
p decrypt 'Tenpr Ubccre'
p decrypt 'Nqryr Tbyqfgvar'
p decrypt 'Nyna Ghevat'
p decrypt 'Puneyrf Onoontr'
p decrypt 'Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv'
p decrypt 'Wbua Ngnanfbss'
p decrypt 'Ybvf Unyog'
p decrypt 'Pynhqr Funaaba'
p decrypt 'Fgrir Wbof'
p decrypt 'Ovyy Tngrf'
p decrypt 'Gvz Orearef-Yrr'
p decrypt 'Fgrir Jbmavnx'
p decrypt 'Xbaenq Mhfr'
p decrypt 'Wbua Ngnanfbss'
p decrypt 'Fve Nagbal Ubner'
p decrypt 'Zneiva Zvafxl'
p decrypt 'Lhxvuveb Zngfhzbgb'
p decrypt 'Unllvz Fybavzfxv'
p decrypt 'Tregehqr Oynapu'
