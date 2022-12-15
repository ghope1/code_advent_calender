% Part 2 of Code Advent Calendar Day 6: https://adventofcode.com/2022/day/7#part2
%

% reads in and erases all fluff commands
commandList = readlines('file_input.txt');
commandList = commandList(commandList~="$ ls" & ~(contains(commandList, "dir ")));

% the parent of all directory nodes
directory = digraph(0, "source");
currFolder = "source";

% loops through all relevanty commands
for i = 1:numel(commandList)
    currCommand = commandList(i);
    
    % if user wants to go to parent
    if(contains(currCommand, "$ cd .."))
        %change current folder to parent
        currFolder = directory.predecessors(currFolder);
        
    % if user wants to go to child
    elseif(contains(currCommand, "$ cd"))
        % if child does not already exist on directed edge graph
        if findnode(directory, extractAfter(currCommand, 5)) == 0
            directory = addedge(directory, currFolder, extractAfter(currCommand, 5), 0);
            currFolder = extractAfter(currCommand, 5);
            
        % if child does exist somewhere on directed edge graph
        else
            currFolderChildren = bfsearch(directory, currFolder);
            % if child exists on graph, and is a child of current node
            if sum(ismember(currFolderChildren, extractAfter(currCommand, 5))) == 1
                directory = addedge(directory, currFolder, extractAfter(currCommand, 5), 0);
                currFolder = extractAfter(currCommand, 5);
            % if child exists on graph and is a child of another node
            else
                copyName = extractAfter(currCommand, 5);
                % node names must be unique, so makes new node name
                while findnode(directory, copyName) > 0
                    copyName = strcat(copyName, "!");
                end
                directory = addedge(directory, currFolder, copyName, 0);
                currFolder = copyName;
            end
        end
    %if user is defining a file in the current folder
    else
        fileSize = str2double(extractBefore(currCommand, strfind(currCommand, " ")));
        directory = addedge(directory, directory.predecessors(currFolder), currFolder, fileSize);
    end
    plot(directory)
end

allFolders = directory.Nodes; % lists all nodes
currMin = intmax; % current minimum directory size that can be deleted to make 3000000

totalUsedSpace = 0; % stores amount of disc space used
children = bfsearch(directory, "source");
for i = 1:numel(children)
    directorySize = directorySize + sum(directory.Edges(inedges(directory, char(children(j))),'Weight').Weight);
    totalUsedSpace = totalUsedSpace + sum(directory.Edges(inedges(directory, char(children(i))),'Weight').Weight);
end

spaceNeeded = 30000000 - (70000000 - totalUsedSpace); % calcs space needed
for i = 2:numel(allFolders.Name) % loops through all directories
    currFolder = char(allFolders.Name(i));
    children = bfsearch(directory, currFolder);
    directorySize = 0;
    % sums the weight of all edges associated with children
    for j = 1:numel(children)
        directorySize = directorySize + sum(directory.Edges(inedges(directory, char(children(j))),'Weight').Weight);
    end
    if directorySize >= spaceNeeded
        if directorySize < currMin
            currMin = directorySize;
        end
    end
end
currMin