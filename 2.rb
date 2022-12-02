require 'pp'

scores = {
    'rock' => 1,
    'paper' => 2,
    'scissors' => 3,
    'win' => 6,
    'draw' => 3,
    'lose' => 0
}

opponent_map = {
    'A' => 'rock',
    'B' => 'paper',
    'C' => 'scissors'
}

player_map = {
    'X' => 'rock',
    'Y' => 'paper',
    'Z' => 'scissors' 
}

outcome_map_by_selection = {
    'rock' => {
        'rock' => 'draw',
        'paper' => 'lose',
        'scissors' => 'win'
    },
    'paper' => {
        'rock' => 'win',
        'paper' => 'draw',
        'scissors' => 'lose'
    },
    'scissors' => {
        'rock' => 'lose',
        'paper' => 'win',
        'scissors' => 'draw'
    }
}



score = 0
debug = false


# Part 1
# File.foreach("2.txt") do |line|
#     puts '----------------------------------' if debug
#     parts = line.split(' ')

#     opponent_selection = opponent_map[parts[0]]
#     player_selection = player_map[parts[1]]
#     puts "player picked: #{player_selection}, opponent picked: #{opponent_selection}" if debug
#     outcome = outcome_map[player_selection][opponent_selection]
#     puts "outcome was: #{outcome}" if debug

#     puts "score for selection: #{scores[player_selection]}" if debug
#     puts "score for outcome: #{scores[outcome]}" if debug

#     score_for_round = scores[player_selection] + scores[outcome]

#     puts "score for round is: #{score_for_round}" if debug
    

#     score += score_for_round
#     puts "total score so far: #{score}" if debug

# end

# Part 2
outcome_map_by_outcome = {
    'rock' => {
        'draw' => 'rock',
        'lose' => 'scissors',
        'win' => 'paper'
    },
    'paper' => {
        'win' => 'scissors',
        'draw' => 'paper',
        'lose' => 'rock'
    },
    'scissors' => {
        'lose' => 'paper',
        'win' => 'rock',
        'draw' => 'scissors'
    }
}

expected_outcome_map = {
    'X' => 'lose',
    'Y' => 'draw',
    'Z' => 'win'
}

File.foreach("2.txt") do |line|
    puts '----------------------------------' if debug
    parts = line.split(' ')

    opponent_selection = opponent_map[parts[0]]
    desired_outcome = expected_outcome_map[parts[1]]
    puts "desired outcome: #{desired_outcome}" if debug
    player_selection = outcome_map_by_outcome[opponent_selection][desired_outcome]
    
    puts "player picked: #{player_selection}, opponent picked: #{opponent_selection}" if debug
    outcome = outcome_map_by_selection[player_selection][opponent_selection]
    puts "outcome was: #{outcome}" if debug

    puts "score for selection: #{scores[player_selection]}" if debug
    puts "score for outcome: #{scores[outcome]}" if debug

    score_for_round = scores[player_selection] + scores[outcome]

    puts "score for round is: #{score_for_round}" if debug
    

    score += score_for_round
    puts "total score so far: #{score}" if debug

end
puts "Final score: #{score}"
