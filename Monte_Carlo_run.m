% the function is used as part of the Monte Carlo simulation technique
% the output is the mean square error (MSE)
% the inputs are
% 1. an array of random fixed-point numbers
% 2. an array of CORDIC-processed result, using the random fixed-point
% number array
function [MSE, res_expe] = Monte_Carlo_run(res_real, random_in)

    iter_count = length(res_real);
    res_real_double = zeros(iter_count, 1);
    res_expe = zeros(iter_count, 1);

    for i = 1:iter_count
        dummy = res_real(i);
        res_real_double(i) = double(single(dummy));
        res_expe(i) = cos(random_in(i));
    end

    MSE = fi(mean((res_expe - res_real).^2), 1, 32, 30);
    
