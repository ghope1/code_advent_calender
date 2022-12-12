% Part 2 of Code Advent Calendar Day 5: https://adventofcode.com/2022/day/5#part2
%

fileData = readlines('file_input.txt');

%numCols and numRows is the dimensions of the crate stacks
numCols = (strlength(fileData(1))+1)/4;
numRows = find(fileData == "") - 2;

%extracts crate data and stores in appropriately sized cell-array
crateStacks = cell(numRows, numCols); %cell array for storage
for i = 1:numRows
    currRow = fileData(i, 1);
    for j = 1:numCols
        crateStacks{i, j} = currRow{1}(j*4-2); %extracts just crate char
    end
end

%extracts moves data and stores in an appropriately sized matrix
eraseList = ["move ", "from ", " to"];
moves = zeros(numel(fileData) - numRows - 2, 3);
for i = numRows + 3:numel(fileData) %the 'moves' section of the text
    tempData = erase(fileData(i), eraseList); %erases fluff text
    tempData = split(tempData, " "); %seperates numbers
    tempData = str2double(tempData); %converts string to numbers
    moves(i - numRows - 2, :) = transpose(tempData); %places moves in array
end

for i = 1:size(moves, 1)
    for j = moves(i, 1):-1:1
        if(crateStacks{1, moves(i,3)} ~= " ") %if crate will overflow
            tempCell = cell(1, numCols);
            tempCell(1,:) = {' '};
            crateStacks = [tempCell; crateStacks]; %add space to avoid overflow
        end
        
        %find location of top crate in start col
        movedCrateStart = find(crateStacks(:, moves(i, 2)) ~= " ", 1, 'first')-1+j; 
        if isempty(movedCrateStart) %if there is no top crate in start col
            movedCrateStart = size(crateStacks, 1); %just set it to whatever the bottom is
        end
        
        %find location of first empty space in location col
        movedCrateEnd = find(crateStacks(:, moves(i, 3)) ~= " ", 1, 'first') - 1; 
        if isempty(movedCrateEnd)
            movedCrateEnd = size(crateStacks, 1);
        end
        
        %set top of location stack to new crate
        crateStacks(movedCrateEnd, moves(i, 3)) = crateStacks(movedCrateStart, moves(i, 2));
        %delete the old crate
        crateStacks(movedCrateStart, moves(i, 2)) = {' '};
        
    end
end

answerStr = '';
for i = 1:numCols
    %add top crate to answer string
    answerStr = strcat(answerStr, crateStacks(find(crateStacks(:, i) ~= " ", 1, 'first'), i));
end
disp("The top of the crates are:");
disp(answerStr{1});
    