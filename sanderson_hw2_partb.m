%% Steven Anderson
% AME 596
% HW2 Knapsack Problem
% Part B > maximize total return to Dr. Jones
clc; clear all; close all;


%% Generate treasure item weights & values
numtreas = 20;
massmin = 0.05;
massmax = 9;
% n = 15;
% r = rmin + rand(1,n)*(rmax - rmin)

massodd = (massmax - massmin).*rand(numtreas,1) + massmin;
mass = ceil(massodd*4)/4;       % array of item masses (rounded to nearest 0.25)
value = 76807.33*mass;          % array of item values


%% DEFINE INITIAL POPULATION: find a set of popsize solutions that meet mass criteria (bagmass < 15kg)
popsize = 50;      % number of children
population = [];
for i = 1:popsize
over = 1;
while over == 1
    bagmass = 0;
    bagval = 0;
    soln = randi([0,1],numtreas,1);     % generates an initial array of solutions
    
    % Calculate the bag's mass and value
    for j = 1:numtreas
        if soln(j) == 1
            bagmass = bagmass + mass(j);
            bagval = bagval + value(j);
        end
    end
    
    % weed out solutions that have a total mass over 15kg
    if bagmass < 15
        over = 0;
    end
end
population(i,:) = soln;      % initial population array
end


%% RUN GA (CROSSOVER, MUTATION, SELECTION)
gen = 30;   % number of generations
pop = population;

for k = 1:gen
    % CROSSOVER (create a crossover population from the fittest individuals)
    i1 = randi([1 popsize],popsize/2,1);    % list of n/2 random numbers between 1 and n
    i2 = randi([1 popsize],popsize/2,1);    % list of n/2 random numbers between 1 and n
    
    for j = 1:(length(i1)-1)
        [popc(j,:),popc(j+1,:)] = crossover(pop(i1(j),:),pop(i2(j),:)); % CROSSOVER the 2 lists above (i1 & i2)
    end
    
    % MUTATE (create a mutated population from fittest individuals)
    i3 = randi([1 popsize],popsize/2,1);    % list of n/2 random numbers between 1 and n
    
    for j = 1:(length(i3))
        popm(j,:) = mutation(pop(i3(j),:)); % MUTATE random list i3
    end
    
    pop = [pop; popc; popm];    % create a new population
    
    % EVALUATION
    for i = 1:height(pop)
        fit(i,:) = fitnessb(pop(i,:),value,mass);
    end
    
    % SELECTION (pick the top 'popsize' solutions)
    [A,B] = sort(fit,'descend');    % (A is value, B is index)
    A2 = A(1:popsize);
    B2 = B(1:popsize);
    pop = pop(B2,:);
    
    % PLOTTING
    for i = 1:height(pop)       % run final population through fitness fxn
        valuesiterate(i,:) = findval(pop(i,:),value,mass);
    end
    [X,Y] = sort(valuesiterate,'descend');  % X is value, Y is index
    plot(k,X(1),'x')
    hold on
end


%% CALCULATE FINAL VALUES AND DISPLAY RESULTS
for i = 1:height(pop)       % run final population through fitness fxn
    finalvalues(i,:) = findval(pop(i,:),value,mass);
    finalmasses(i,:) = findmass(pop(i,:),mass);
end
[C,D] = sort(finalvalues,'descend');  % C is value, D is index

fprintf("MAXIMUM VALUES: \n")
finalsolution = pop(1,:)
numtreasures = sum(finalsolution)
jonesreturn = (1/3)*finalvalues(1,1)
knapsackmass = finalmasses(D(1,1))






