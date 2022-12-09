import sys
import re
# Part 2 of Code Advent Calendar Day 4: https://adventofcode.com/2022/day/4#part2
#
print('Input Shift Schedule (ctrl+D to end):')
schedule_input = sys.stdin.read()
#schedules = [schedule.split(',') for schedule in schedule_input.split('\n')]
schedules = [re.split(r'[,-]+', schedule) for schedule in schedule_input.split('\n')] #splits on /n , -
schedules = schedules[:len(schedules)-1] #removes ctrl+D from the end
schedules = [list(map(int, i)) for i in schedules] #converts all elements to integers

overlappingShifts = 0
for shiftPair in schedules:    
    if set(range(shiftPair[0], shiftPair[1]+1)).intersection(set(range(shiftPair[2], shiftPair[3]+1))):
        overlappingShifts += 1

print("There are", overlappingShifts, "overlapping shifts.")