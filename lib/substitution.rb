# Substitution when pattern and replacement are in hashes.
module Substitution
  module_function

  def hsub(str, hash)
    temp_str = str.dup

    hash.each { |pattern, replacement| temp_str.gsub!(pattern, replacement) }

    temp_str
  end

  def reverse_leet(str, hash)
    t_str = str.dup

    hash.each { |pat, rep| t_str.gsub!(rep, pat.inspect) }

    t_str
  end
end
