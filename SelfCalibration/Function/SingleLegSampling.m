clear; clc; close all

%% Initialize Nao Parameters
NaoInitial;
step = 5;   % 2 deg as the incrementation of the angle

%% Locate the useful joints for sampling and generate all the possible combinations
Loc = find(JointFlag ~= 0);
Vec = cell(1, length(Loc));

for i = 1:length(Loc)
    Vec_temp = JointLim0(Loc(i)):step:JointLim1(Loc(i));
    Vec{i} = Vec_temp;
end

combinations = cell(1, numel(Vec)); %set up the varargout result
[combinations{:}] = ndgrid(Vec{:});
combinations = cellfun(@(x) x(:), combinations,'uniformoutput',false); %there may be a better way to do this
result = [combinations{:}]; % NumberOfCombinations by N matrix. Each row is unique.