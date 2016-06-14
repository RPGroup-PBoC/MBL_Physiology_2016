% Using Matlab

% kind of like a calculator
2+2

% define a variable
a = 4

% semicolon supresses output
a = 6;

% can look at vectors and matrices of numbers
b = [1 2 5 7]
b2 = [0:4:20]

c = [1 2 3; 4 5 6; 7 8 9]

% call on positions in a vector or matrix
b(3)

c(2,1)
% in row,column notation

%%% Use the Euler method to predict the
% number of cells over time

N1 = 1; % start with 1 cells at first time point
r = 1/30; % rate constant for cell growth

dN_dt = N1*r; % dNdt for the first time point
dt = 30; % time in min

% calculate at 30 minutes
N2 = N1 + dN_dt * dt;

% write a for loop to automatically calculate the
% growth curve
dt = 1; % 1 min

% what is the initial number of cells
N = [];
N(1) = 1;

for t = 2:500
    N(t) = N(t-1) + N(t-1)*r * dt;
end

% make a vector of time
time = [1:1:500];

plot(time,N)

% plot on a log scale
semilogy(time,N)

% semilogx, loglog
xlabel('time in minutes')
ylabel('number of cells')
    





