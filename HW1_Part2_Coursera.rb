require 'pp'

class WrongNumberOfPlayersError < StandardError; end
class NoSuchStrategyError < StandardError; end

def rps_game_winner(game)
  raise WrongNumberOfPlayersError unless game.length == 2

  p1_choice = game[0][1]
  p2_choice = game[1][1]
  player1 = game[0][0]
  player2 = game[1][0]
  winning_outcomes = ["rs", "sp", "pr"]
  tie_outcomes = ["rr", "ss", "pp"]

  raise NoSuchStrategyError unless p1_choice.downcase.match(/[rps]/) && p2_choice.downcase.match(/[rps]/)

  if winning_outcomes.index(p1_choice.downcase+p2_choice.downcase)
    #puts "#{player1} faced off against #{player2} and won! His choice was: #{p1_choice}"
    return ["#{player1}", "#{p1_choice}"]
  elsif tie_outcomes.index(p1_choice.downcase+p2_choice.downcase)
    #puts "#{player1} faced off against #{player2} and won! His choice was: #{p1_choice}"
    return ["#{player1}", "#{p1_choice}"]
  else
    #puts "#{player2} faced off against #{player1} and won! His choice was: #{p2_choice}"
  	return ["#{player2}", "#{p2_choice}"]
  end
end

#rps_game_winner([ ["Armando", "P"], ["Dave", "P"] ])

tournament = 
[
    [
        [ ["Armando", "P"], ["Dave", "S"] ],
        [ ["Richard", "R"],  ["Michael", "S"] ],
    ],
    [
        [ ["Allen", "S"], ["Omer", "P"] ],
        [ ["David E.", "R"], ["Richard X.", "P"] ]
    ]
]

#tournament = [ ["Armando", "P"], ["Dave", "S"] ]


def rps_tournament_winner(tournament)
  tournament.flatten!
  game = Array.new; game << [tournament[0], tournament[1]]; game << [tournament[2], tournament[3]]

  # while tournament.length > 2 do
  #   tournament.each_slice(4).map{ |p1, s1, p2, s2| rps_game_winner([[p1, s1], [p2, s2]]) }
  # end

  # puts "The winner is #{tournament[0]}! Her choice was: #{tournament[1]}!"
  # return tournament

  while tournament.length > 2
    tournament.slice!(0..3)
    if tournament.length == 2
      puts "The winner is #{tournament[0]}! His or her choice was: #{tournament[1]}!"
    end
    tournament << rps_game_winner(game)
    rps_tournament_winner(tournament)
  end
  return tournament
end

array = rps_tournament_winner(tournament)
pp array


