% used to generate the K value
% format of K is fix-point
% K is used in CORDIC algorithm for scaling the outout
function K = K_gen(iter_lut)

% all numbers/number arrays are in fixed point format

ratio = fi(1, 1, 96, 90);

for i = 1:size(lut, 1)
    ratio = ratio * fi(cos(lut(i, 2)), 1, 32, 30);
end

