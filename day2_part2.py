import sys
# Part 2 of Code Advent Calendar Day 2: https://adventofcode.com/2022/day/2#part2
# 
rps_points = { #key for point values of rock, paper, and scissors
    "A": 1, #rock
    "B": 2, #paper
    "C": 3, #scissors
}

rps_rules = { #returns player 1's score for the round based on p1 - p2 
    -2: 6, #p1 chose scis, p2 chose pape
    -1: 0, #p1 chose scis and p2 chose rock or p1 chose pape and p2 chose scis
     0: 3, #p1 and p2 chose the same thing
     1: 6, #p1 chose rock and p2 chose scis or p1 chose scis and p2 chose pape
     2: 0  #p1 chose pape, p2 chose scis
}

print('Input Strategy Guide (ctrl+D to end):')
strategy_guide = sys.stdin.read()
strategy_list = [strat.split(' ') for strat in strategy_guide.split('\n')] 
strategy_list = strategy_list[:len(strategy_list)-1] #removes ctrl+D from the end

p2_totalScore = 0
for turn in strategy_list:
    p1_turn = rps_points[turn[0]] #player 1's turn in points

    if turn[1] == 'X': #player 2 needs to lose, calculates losing move
        p2_turn = p1_turn - 1 
        if p2_turn == 0: p2_turn = 3
    elif turn[1] == 'Y': #player 2 needs to tie, calculates tying move
        p2_turn = p1_turn
    else: #player 2 needs to win, calculates winning move
        p2_turn = p1_turn + 1
        if p2_turn == 4: p2_turn = 1

    p1_score = rps_rules[p1_turn - p2_turn] #p1's turn points
    p2_totalScore += 6 - p1_score #adds p2's turn points 
    p2_totalScore += p2_turn #adds bonus based on what was picked

print('Player 2 Earned:', p2_totalScore, 'points.')