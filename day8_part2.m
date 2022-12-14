% Part 2 of Code Advent Calendar Day 8: https://adventofcode.com/2022/day/8#part2
%

treeMap = readlines('file_input.txt'); 
treeMapWidth = strlength(treeMap(1)); 
treeMapHeight = numel(treeMap);
bestScenicScore = -1;

% since scenic score is multiplied in each direction,
% and the edges have no trees visible in at least one direction,
% they will always have a scenic score of 0. So not worth checking.

%loops through every inner tree in the grid
for i = 2:treeMapHeight-1
    for j = 2:treeMapWidth-1
        currRow = treeMap(i);
        currScenicScore = 1;
        currTreeHeight = str2double(currRow{1}(j));
        
        %counts number of visible trees left to right
        numVisible = 0;
        for k = j+1:treeMapHeight
            numVisible = numVisible + 1;
            if currTreeHeight <= str2double(currRow{1}(k))
                break;
            end
        end
        currScenicScore = currScenicScore * numVisible;
        
        %counts number of visible trees right to left
        numVisible = 0;
        for k = j-1:-1:1
            numVisible = numVisible + 1;
            if currTreeHeight <= str2double(currRow{1}(k))
                break;
            end
        end
        currScenicScore = currScenicScore * numVisible;
        
        %counts number of visible trees bottom to top
        numVisible = 0;
        for k = i+1:treeMapHeight
            numVisible = numVisible + 1;
            currRow = treeMap(k);
            if currTreeHeight <= str2double(currRow{1}(j))
                break;
            end
        end
        currScenicScore = currScenicScore * numVisible;
        
        %counts number of visible trees top to bottom
        numVisible = 0;
        for k = i-1:-1:1
            numVisible = numVisible + 1;
            currRow = treeMap(k);
            if currTreeHeight <= str2double(currRow{1}(j))
                break;
            end
        end
        currScenicScore = currScenicScore * numVisible;
        
        if currScenicScore > bestScenicScore
            bestScenicScore = currScenicScore;
        end
    end
end

disp("The best possible scenic score is:");
disp(bestScenicScore);