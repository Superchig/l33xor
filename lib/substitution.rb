module Substitution
  module_function

  def hsub(str, hash)
    temp_str = str.dup

    hash.each { |pattern, replacement| temp_str.gsub!(pattern, replacement) }

    temp_str
  end

  def reverse_leet(str, hash)
    temp_str = str.dup

    hash.each { |pattern, replacement| temp_str.gsub!(replacement, pattern.inspect) }

    temp_str
  end
end
