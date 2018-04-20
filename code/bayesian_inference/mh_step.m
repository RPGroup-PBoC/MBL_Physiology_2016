function [x_out, logpost_updated, accepted] = mh_step(x, log_post,...
                                                       logpost_current,...
                                                       sigma)
%     Parameters
%     ----------
%     x : array, shape (n_variables)
%         The present location of the walker in parameter space.
%     log_post : function
%         The function to compute the log posterior. It has call
%         signature `log_post(x, *args)`.
%     log_post_current : float
%         The current value of the log posterior.
%     sigma : array, shape (n_variables)
%         The standard deviations for the proposal distribution.
%     varargin : cell array.
%         For a variable number of input arguments
%     Returns
%     -------
%     x_out : array, shape (n_variables)
%         The position of the walker after the Metropolis-Hastings
%         step. If no step is taken, returns the inputted `x`.
%     log_post_updated : float
%         The log posterior after the step.
%     accepted : bool
%         True is the proposal step was taken, False otherwise.

% Propose a new position for the walker
x_new = normrnd(x, sigma);

% Evaluate the log_posterior at the new proposed step
logpost_new = log_post(x_new);

% Compute log metropolis ratio
log_r = logpost_new - logpost_current;

% Check if we accept step or not
if log_r > 0
    accepted = 1;
    logpost_updated = logpost_new;
    x_out = x_new;
else
    % flip a coin to decide if accept the step or not
    accepted = binornd(1, exp(log_r));
    if accepted == 1
        logpost_updated = logpost_new;
        x_out = x_new;
    else
        logpost_updated = logpost_current;
        x_out = x;
        
    end % if
    
end % if

end