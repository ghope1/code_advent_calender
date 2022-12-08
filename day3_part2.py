import sys
# Part 2 of Code Advent Calendar Day 3: https://adventofcode.com/2022/day/3#part2
#
print('Input Rucksack Contents (ctrl+D to end):')
rucksack_input = sys.stdin.read()
rucksacks = rucksack_input.split('\n') 
rucksacks = rucksacks[:len(rucksacks)-1] #removes ctrl+D from the end
totalPriority = 0

#this function checks 3 rucksacks for matching items and returns its priority
def checkRucksacks(rucksack1, rucksack2, rucksack3):
    for firstItem in rucksack1: #checks first rucksack
        for secondItem in rucksack2: #checks second rucksack
            if firstItem == secondItem:
                for thirdItem in rucksack3:
                    if firstItem == thirdItem:        
                        if(ord(firstItem) >= 65 and ord(firstItem) <= 90): #if uppercase
                            return ord(firstItem)  - ord('A') + 27 #calcs item priority               
                        else:
                            return ord(firstItem) - ord('a') + 1 #calcs item priority

for i in range(0, len(rucksacks), 3): #checks rucksacks in groups of 3
    totalPriority += checkRucksacks(rucksacks[i], rucksacks[i+1], rucksacks[i+2])
            
print('Total Priority:', totalPriority)