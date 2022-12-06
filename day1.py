import sys

print('Input Reindeer Calories List (ctrl+D to end):')
calorie_input = sys.stdin.read()
calorie_list = calorie_input.split('\n')

top_3 = [0, 0, 0]
currMin = 0
runningTotal = 0
for calories in calorie_list:
    if calories == '':
        top_3[top_3.index(currMin)] = runningTotal if runningTotal > currMin else currMin
        runningTotal = 0
        currMin = min(top_3)
    else:
        runningTotal += int(calories)

print("Da hungriest bois are gobblin", top_3)
print("for a total of ", sum(top_3), "calories gobbled.")