% the function is used to generate the lookup table
% the input is a number to determine the length of the lookup table
function lut = arctan_lut_gen(lim)

% each row has two cells
% the first cell is for storing the index of 2
% the second cell is for storing the corresponding arctan value
lut = fi(zeros(lim+1, 2), 1, 64, 60);

for i = 1:lim+1
    lut(i,1) = i-1;
    lut(i,2) = atan(2^(-i+1));
end
