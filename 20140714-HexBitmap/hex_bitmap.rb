# [7/14/2014] Challenge #171 [Easy] Hex to 8x8 Bitmap
# http://www.reddit.com/r/dailyprogrammer/comments/2ao99p/7142014_challenge_171_easy_hex_to_8x8_bitmap/

# Sample Input
# 18 3C 7E 7E 18 18 18 18
# FF 81 BD A5 A5 BD 81 FF
# AA 55 AA 55 AA 55 AA 55
# 3E 7F FC F8 F8 FC 7F 3E
# 93 93 93 F3 F3 93 93 93

def hex_bitmap hex
  bin = hex.split(' ').map do |n|
    n.hex.to_s(2).rjust(8, '0').gsub(/[01]/, '0' => ' ', '1' => 'x')
  end

  bin.each { |n| puts n }
end

sample = [
%q{18 3C 7E 7E 18 18 18 18},
%q{FF 81 BD A5 A5 BD 81 FF},
%q{AA 55 AA 55 AA 55 AA 55},
%q{3E 7F FC F8 F8 FC 7F 3E},
%q{93 93 93 F3 F3 93 93 93}
]

sample.each { |item| hex_bitmap item; puts "================" }
