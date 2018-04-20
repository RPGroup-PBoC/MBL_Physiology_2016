function output = mh_sample(log_post, x0, sigma, n_burn, n_steps)
%     Parameters
%     ----------
%     log_post : function
%         The function to compute the log posterior. It has call
%         signature `log_post(x)`.
%     x0 : array, shape (n_variables)
%         The starting location of a walker in parameter space.
%     sigma : array, shape (n_variables)
%         The standard deviations for the proposal distribution.
%     n_burn : int
%         Number of burn-in steps.
%     n_steps : int
%         Number of steps to take after burn-in.
%     
%     Returns
%     -------
%     output : array
%         The first `n_variables` columns contain the samples.
%         Additionally, column 'lnprob' has the log posterior value
%         at each sample.

% Initialize array to save output
output = zeros(n_steps, 2);

x_out = x0;
logpost_current = log_post(x0);
% Perform burn-in
for i=1:n_burn
    [x_out, logpost_current, accepted] = mh_step(x_out, log_post,...
                                                  logpost_current, sigma);
end % for

for j=1:n_steps
    [x_out, logpost_current, accepted] = mh_step(x_out, log_post,...
                                                  logpost_current, sigma);
    output(j, :) = [x_out, logpost_current];
end % for

end