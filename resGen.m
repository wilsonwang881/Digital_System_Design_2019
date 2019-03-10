% the function is used to get the correct answer
% using double precision
function res = resGen(in_array)

res = 0;

for c = 1:length(in_array)
    x = in_array(c);
    res = res + 0.5*x + x^2*cos((x-128)/128);
end

