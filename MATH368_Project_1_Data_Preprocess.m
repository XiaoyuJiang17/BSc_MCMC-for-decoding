% This piece of code does the job of data preprocess
% The first 842 and last 364 lines have already been deleted in the file "War and Peace.txt" 
% Following has been done: 
% 1. convert all letters to upper case
% 2. Only select characters that in alph, new text is stored in 'data.txt'
clear;clc;
filename = 'War and Peace.txt';
file = fileread(filename);
upperfile = upper(file);

%by converting to ASCII, we only select characters in alph(corresponding ASCII are 65-90 and 32)
upperfile_asc=abs(upperfile);
upperfile_asc(~(((65<=upperfile_asc)&(upperfile_asc<=90))|(upperfile_asc==32)))=[];
upperfile=char(upperfile_asc);

%Store the selected text in data.txt
fileID = fopen("data.txt",'w');
fprintf(fileID,upperfile);
fclose(fileID);