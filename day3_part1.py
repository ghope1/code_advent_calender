import sys
# Part 1 of Code Advent Calendar Day 3: https://adventofcode.com/2022/day/3
#
print('Input Rucksack Contents (ctrl+D to end):')
rucksack_input = sys.stdin.read()
rucksacks = rucksack_input.split('\n') 
rucksacks = rucksacks[:len(rucksacks)-1] #removes ctrl+D from the end
totalPriority = 0

#this function finds the matching item and returns its priority
def checkRucksack(rucksack):
    for firstItem in rucksack[:int(len(rucksack)/2)]: #checks first half
        for secondItem in rucksack[int(len(rucksack)/2):]: #checks second half
            if firstItem == secondItem:
                if(ord(firstItem) >= 65 and ord(firstItem) <= 90):
                    return ord(firstItem)  - ord('A') + 27 #calcs item priority               
                else:
                    return ord(firstItem) - ord('a') + 1 #calcs item priority

for rucksack in rucksacks:
    totalPriority += checkRucksack(rucksack)
            
print('Total Priority:', totalPriority)
