% Plotting the course data and gregor. 


% Enumerate the course data. 
dosage_half = [0.284, 0.2482, 0.2908, 0.2567, 0.2584];
dosage_wt = [0.304, 0.3207, 0.3806, 0.3224, 0.3276, 0.3196, 0.3776,0.3374];
dosage_twice = [0.356, 0.3461, 0.3586, 0.3432, 0.3389];

% Compute the prediction. 
lam = 0.19;
xcf = 0.32; 
D = linspace(0.3, 2.0, 500);
prediction = xcf + lam * log(D);
semilogx(D, prediction)
hold on;

% Plot the student data. 
