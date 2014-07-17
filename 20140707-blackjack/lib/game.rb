require_relative './blackjack'
require 'pry'

puts "==================="
puts "     Blackjack"
puts "==================="

print "\nHow many players? "
input = gets.chomp.to_i
input += 3 if input < 2

game = Blackjack.new input
game.deal

while game.status do
  game.deal

  puts "\nCurrent Hand"
  puts "------------"
  game.players.each do |player|
    puts player.to_s
  end

  puts "\nScores"
  puts "------"

  puts game.scores

  if game.status
    puts "\nDeal again?"
    puts "-----------"
    input = gets.chomp.downcase

    game.end if !['y', 'yes'].include?(input)
  end
end

puts "\n------------------"
puts "Thanks for playing"
puts "------------------"
