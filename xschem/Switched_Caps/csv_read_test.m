%% Cleanup

clear all
clc 
close all

%% Get data

%pulse = [1;2;3;4;5;6;7;8;9;10;11;12;13;14;15;16;17;18;19;20;21;22;23;24];
data = readtable('invtest.csv');%table(pulse);%readtable('tester.csv');
structure_out = reader(data, 4);  %change the second value to be the number of values pulled from xschem (time + variables)

%% Functions

function structure_out = reader(data, num_values)

    structure_out = struct();
    name_array = zeros(1,num_values);
    name_cell = num2cell(name_array);
    name = 'val0';
    for i = 1:num_values
        if i < 10
            name(4) = num2str(str2num(name(4)) + 1);
            name_cell{i} = name;
            structure_out.(name) = [];
        end
        if i >= 10 & i <100
            name = 'val10';
            name(4:5) = num2str(i);
            name_cell{i} = name;
            structure_out.(name) = [];
        end
    end
    
    for i = 1:num_values
        values = zeros(1,height(data)/num_values); %values = zeros(1,height(data)/4);
        inter =  i;
        values(1) = data{i,1};
        for j = 2:(height(data)/num_values)
            values(j) = data{i + num_values*(j-1), 1};
        end
        structure_out.(name_cell{i}) = values;
    end
    
end