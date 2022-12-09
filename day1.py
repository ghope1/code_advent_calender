import sys
# Part 1 and 2 of Code Advent Calendar Day 1: https://adventofcode.com/2022/day/1
#                                             https://adventofcode.com/2022/day/1#part2
print('Input Reindeer Calories List (ctrl+D to end):')
calorie_input = sys.stdin.read()
calorie_list = calorie_input.split('\n')

top_3 = [0, 0, 0]
runningTotal = 0
for calories in calorie_list:
    if calories == '':
        currMin = min(top_3)
        top_3[top_3.index(currMin)] = runningTotal if runningTotal > currMin else currMin
        runningTotal = 0 
    else:
        runningTotal += int(calories)

print("The 3 hungriest reindeer ate", top_3)
print("for a total of ", sum(top_3), "calories gobbled.")

