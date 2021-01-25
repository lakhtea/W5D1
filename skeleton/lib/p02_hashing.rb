class Integer
  # Integer#hash already implemented for you
end

class Array
  def hash
    count = 0
    self.each_with_index {|el, i| i.even? ? count += el : count -= el}
    count
  end
end

class String
  def hash
    alpha = ('a'..'z').to_a
    count = 0
    self.each_char.with_index {|char, i| i.even? ? count += alpha.index(char.downcase) : count -= alpha.index(char.downcase)}
    count
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    #0
    alpha = ('a'..'z').to_a
    #count_key = 0
    count_val = 0
    #keys = self.keys
    values = self.values
    #keys.each_with_index {|char, i| i.even? ? count_key += alpha.index(char.downcase) : count_key -= alpha.index(char.downcase)}
    values.each_with_index do |char, i|
      if char.is_a?(String)
        count_val += alpha.index(char.downcase)
      else
        count_val += char
      end
    end
    count_val
  end
end
