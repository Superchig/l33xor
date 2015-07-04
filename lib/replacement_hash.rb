# Holds all the hashes used for replacing words.
module ReplacementHash
  DEFAULT = {
    /\belite\b/i => "l33t",
    /\bnormal/i => "n00b",
    /\bhacker/i => "haxx0r",
    /\byou/i => "j00",
    /\bchick/i => "chix0r",
    /fear/i => "ph33r"
  }

  HARDCORE = DEFAULT
             .merge(
               /h/i => "|-|",
               /a/i => "4",
               /e/i => "3",
               /w/i => "\\/\\/",
               /i/i => "1",
               /o/i => "0"
             )
end
