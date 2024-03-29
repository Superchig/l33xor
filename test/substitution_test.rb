require 'minitest/autorun'
require 'require_all'

require_rel '../lib/substitution.rb'

# Tests the substitution module
class TestSubstitution < Minitest::Test
  def test_hsub
    before_str = "The normals are amongst us! Beware of elite hackers."
    after_str = "The n00bs are amongst us! Beware of l33t haxxors."

    sub_hash = {
      "normal" => "n00b",
      "elite" => "l33t",
      "hacker" => "haxxor"
    }

    assert_equal after_str, Substitution.hsub(before_str, sub_hash)
  end

  def test_un_l33t
    after_str = "The normals are amongst us! Beware of elite hackers."
    before_str = "The n00bs are amongst us! Beware of l33t haxxors."

    sub_hash = {
      "normal" => "n00b",
      "elite" => "l33t",
      "hacker" => "haxxor"
    }

    assert_equal after_str, Substitution.reverse_leet(before_str, sub_hash)
  end
end
