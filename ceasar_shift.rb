=begin

char_code 
A - 65
Z - 90

a - 97
z - 122
=end


def crypt_text(word,num)
    result=''   

    word.length.times do |letter|
        char_code=word[letter].ord
        new_char_code=crypt_code(char_code,num)
        result+=new_char_code.chr
    end
    result
end


def crypt_code(char_code,num)

    if char_code >=65 && char_code<=90
        if char_code+num>90
            return char_code+num-26
        elsif char_code+num<65
            return char_code+26
        else 
            return char_code+num
        end
    end

    if char_code >=97 && char_code<=122
        if char_code+num>122
            return char_code+num-26
        elsif char_code+num<97
            return char_code+26
        else 
            return char_code+num
        end
    end

    return char_code
end

def caesar_cipher(text,num)
    array=text.split(' ')
    array=array.map do |word|
        crypt_text(word,num)
    end
    array.join(' ')
end

puts 'enter text space included:'
text=gets.chomp

puts 'enter key:'
key=gets.chomp

puts caesar_cipher(text,key.to_i)