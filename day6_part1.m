% Part 1 of Code Advent Calendar Day 6: https://adventofcode.com/2022/day/6
%
MSG_LEN = 4;  %length of unique character message

fileData = readlines('file_input.txt');
dataStream = cell(1, 4);
oldestIndex = 0; %marks where the fifo queue is
for i = 1:MSG_LEN
    dataStream{i} = fileData{1}(i); %initially load up the queue
end

if numel(unique(dataStream)) == MSG_LEN %check initial queue for unique set
    disp("The index of the first unqiue set is:")
    disp(i)
    return
end


for i = MSG_LEN+1:strlength(fileData)
    dataStream{oldestIndex+1} = fileData{1}(i); %replaces oldest element
    oldestIndex = mod(oldestIndex + 1, MSG_LEN); %move index
    
    if numel(unique(dataStream)) == MSG_LEN %checks for MSG_LEN unique chars
       disp("The index of the first unqiue set is:")
       disp(i)
       return
    end
end