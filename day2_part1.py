import sys

rps_points = { #key for point values of rock, paper, and scissors
    "A": 1, #rock
    "B": 2, #paper
    "C": 3, #scissors
    "X": 1, #rock
    "Y": 2, #paper
    "Z": 3  #scissors
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
    p1_score = rps_rules[rps_points[turn[0]] - rps_points[turn[1]]] #p1's turn points
    p2_totalScore += 6 - p1_score #adds p1's turn points 
    p2_totalScore += rps_points[turn[1]] #adds bonus based on what was picked

print(p2_totalScore)