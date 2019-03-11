clear
clc

test_case1_in = 0:5:255;
test_case2_in = 0:1/8:255;
test_case3_in = 0:1/1024:255;
test_case1_out = resGen(test_case1_in);
test_case2_out = resGen(test_case2_in);
test_case3_out = resGen(test_case3_in);

% generate the look up table
lut = arctan_lut_gen(16);

% generate the complete look up table
lut_complete = arctan_lut_gen(31);
lut_bin = lut_to_bin(lut_complete);

% testing the CORDIC function defined in cordic.m
input_angle = -0.5;
res_x = cordic(lut, input_angle);
fprintf("input = %f\n", input_angle);
fprintf("cos = %f\n", res_x);

% calculating the confidence level
loop_count = 100;
MSE_out = zeros(loop_count, 1);
confidence_level_count = 0;

for j = 1:loop_count
    fprintf("Loop number: %d/%d\n", j, loop_count);
    iter_count = 100;
    random_in = fi(zeros(iter_count, 1), 1, 32, 30);
    random_out = fi(zeros(iter_count, 1), 1, 32, 30);

    for i = 1:iter_count
        random_in(i,1) = -1 + 2 * rand();
        random_out(i, 1) = cordic(lut, random_in(i, 1));
    end

    MSE_out(j) = Monte_Carlo_run(random_out, random_in);
end

for i = 1:loop_count
    if MSE_out(i) <= 1*10^(-10)
        confidence_level_count  = confidence_level_count + 1;
    end
end

confidence_level = confidence_level_count/loop_count;
MSE_mean = mean(MSE_out);
 
fprintf("MSE = %f\n", MSE_mean);
fprintf("confidence level count = %f\n", confidence_level_count);
fprintf("confidence level = %f\n", confidence_level);