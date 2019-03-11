% the function is used to generate the lookup table
% the input is a number to determine the length of the lookup table
function lut = arctan_lut_gen(lim)

lut = fi(zeros(lim, 1), 1, 32, 30);

for i = 1:lim+1
    lut(i,1) = atan(2^(-i+1));
end
