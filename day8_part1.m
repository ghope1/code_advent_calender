% Part 1 of Code Advent Calendar Day 8: https://adventofcode.com/2022/day/8
%

fileData = readlines('file_input.txt'); 
treeMapWidth = strlength(fileData(1)); 
treeMapHeight = numel(fileData);

treeBool = zeros(treeMapWidth, treeMapHeight); %2D array storing visible status

%loops through left and right directions
for i = 1:treeMapHeight
    currRow = fileData(i);
    
    %loops left to right
    currMax = -1;
    for j = 1:treeMapWidth
        if str2double(currRow{1}(j)) > currMax
            currMax = str2double(currRow{1}(j));
            treeBool(i, j) = 1;
        end
    end
    
    %loops right to left
    currMax = -1;
    for j = treeMapWidth:-1:1
        if str2double(currRow{1}(j)) > currMax
            currMax = str2double(currRow{1}(j));
            treeBool(i, j) = 1;
        end
    end
end

%loops through up and down directions
for i = 1:treeMapWidth
    
    %loops from top to bottom
    currMax = -1;
    for j = 1:treeMapHeight
        currRow = fileData(j);
        if str2double(currRow{1}(i)) > currMax
            currMax = str2double(currRow{1}(i));
            treeBool(j, i) = 1;
        end
    end
    
    %loops from bottom to top
    currMax = -1;
    for j = treeMapHeight:-1:1
        currRow = fileData(j);
        if str2double(currRow{1}(i)) > currMax
            currMax = str2double(currRow{1}(i));
            treeBool(j, i) = 1;
        end
    end
end

disp("The total number of visible trees is:");
disp(sum(treeBool(:)==1));

