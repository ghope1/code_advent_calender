import sys
import re
# Part 1 of Code Advent Calendar Day 4: https://adventofcode.com/2022/day/4
#
print('Input Shift Schedule (ctrl+D to end):')
schedule_input = sys.stdin.read()
#schedules = [schedule.split(',') for schedule in schedule_input.split('\n')]
schedules = [re.split(r'[,-]+', schedule) for schedule in schedule_input.split('\n')] #splits on /n , -
schedules = schedules[:len(schedules)-1] #removes ctrl+D from the end
schedules = [list(map(int, i)) for i in schedules] #converts all elements to integers

redundantShifts = 0
for shiftPair in schedules:    
    if shiftPair[0] <= shiftPair[2] and shiftPair[1] >= shiftPair[3]:
        redundantShifts += 1
    elif (shiftPair[0] >= shiftPair[2]) and (shiftPair[1] <= shiftPair[3]): 
        redundantShifts += 1

print("There are", redundantShifts, "redundant shifts.")