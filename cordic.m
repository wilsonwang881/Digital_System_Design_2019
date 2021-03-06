% the function is used to calculate cosine/sine
% based on the CORDIC algorithm
% with two inputs: the lookup table and the angle value
% the output is adjustable
% either change to res_y to output the sine value
% or change to res_x to output the cosine value
function res_x = cordic(lut, target)

% all numbers/number arrays are in fixed point format

res_angle = fi(target, 1, 32, 30);
res_x = fi(1, 1, 32, 30);
res_y = fi(0, 1, 32, 30);
sign = fi(0, 1, 32, 30);
x = fi(0, 1, 32, 30);
y = fi(0, 1, 32, 30);

for i = 1:size(lut, 1)
    if res_angle > 0
        res_angle = res_angle - lut(i, 1);
        sign = 1;        
    else
        res_angle = res_angle + lut(i, 1);
        sign = -1;
    end 
    x = res_x;
    y = res_y;
    expo = fi(2^(-i+1), 1, 32, 30);
    res_x = x - sign * expo * y;
    res_y = y + sign * expo * x;
end
ratio_re = fi(0.6072529350088812561694, 1, 32, 30);
res_x = res_x * ratio_re;
res_y = res_y * ratio_re;
