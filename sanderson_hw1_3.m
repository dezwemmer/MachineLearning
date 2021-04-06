%% Steven Anderson
% AME 596
% HW1 #3
% McCulloch-Pitts Neural Network for Classifying Images
clc
clear all
close

%% Import image and translate it into input array "a1"
% train = importdata('training.txt');
% test = importdata('test.txt');
image = importdata('testF.txt');
a1 = [];
for i = 1:7 %column
    for j = 1:7 %row
        a1 = [a1; image(j,i)];
    end
end


%% Hidden layer weights & bias arrays
w1 = zeros(6,49);
b1 = zeros(6,1);

% region 1 (left side)
w1(1,10) = 1;
w1(1,11) = 1;
w1(1,12) = 1;

% region 2 (top)
w1(2,16) = 1;
w1(2,23) = 1;
w1(2,30) = 1;

% region 3 (right side)
%w1(3,38) = 1;
w1(3,39) = 2;
w1(3,40) = 2;
%w1(3,18) = 1;   % added so 'F' outweighs bias
%w1(3,20) = 1;
%b1(3,1) = -1;

% region 4 (center low)
w1(4,20) = 1;
w1(4,27) = 1;
w1(4,34) = 1;

% region 5 (center mid)
w1(5,19) = 1;
w1(5,26) = 1;
w1(5,33) = 1;

% region 6 (center high)
w1(6,18) = 1;
w1(6,25) = 1;
w1(6,32) = 1;

%% Calculate hidden layer activations
a2 = sign(w1*a1+b1)

%% Output layer weights & bias arrays
b2 = zeros(4,1);

w2 = [0 1 0 0 0 0
      0 0 1 0 0 0
      0 0 0 1 0 0
      0 0 0 0 1 0];


%% Calculate Output layer activations
a3 = sign(w2*a2+b2)

%% Logic for printing results
if a3 == [0;0;1;0]
    fprintf('This is an L\n')
elseif a3 == [1;1;0;1]
    fprintf('This is an A\n')
elseif a3 == [1;0;1;0]
    fprintf('This is a C\n')
elseif a3 == [1;1;1;0]
    fprintf('This is an O\n')
elseif a3 == [1;0;0;0]
    fprintf('This is an F\n')
else
    fprintf('Unrecognized character\n')
end



    
    