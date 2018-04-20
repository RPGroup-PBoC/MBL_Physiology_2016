% Define the parameters.
r = 9;  % in dimensions of inverse time. 
gamma = 10; % in dimensions of inverse time. 
dt = 1 / 50    ; % time step
totalTime = 50;  % in dimensions of time. 
timeSteps = totalTime / dt;  % Total number of time steps. 
maxLength = 100;  % In units of monomers
% Set up the storage matrix. 
pL = zeros(maxLength, timeSteps);

% Set the initial condition. 
pL(1, 1) = 1.0;  % start with delta function at length 0. 

% Loop through each time step. 
for t=2:timeSteps
    % Compute the master equation for the boundary. 
    ell = 1;
    pL(ell, t) = pL(ell, t-1) + gamma * dt * pL(ell+1, t-1) - r * dt * pL(ell, t-1);
    
    for ell=2:(maxLength - 1)
        pL(ell, t) = pL(ell, t-1) + r * dt * pL(ell-1, t-1) +...
            gamma * dt * pL(ell+1, t-1) - dt * pL(ell, t-1) * (r + gamma);
    end
    
    % Compute the end box. 
    ell = maxLength;
    pL(ell, t) = pL(ell, t-1) + r * dt * pL(ell -1, t-1) - gamma * dt * pL(ell, t-1);
end

% Make a 3d plot showing every 20th time point. 
time = 1:20:timeSteps;
bar3(pL(:, 1:20:timeSteps))
% bar3(pL)


figure()

% Plot the analytical solution. 
L = linspace(0, maxLength, 1000);
soln = (r / gamma).^L * (1 - (r / gamma));
bar(bins, pL(:, timeSteps));
hold on;
plot(L, soln, 'r-', 'LineWidth', 2);
hold off;

