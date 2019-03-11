clear
clc


test_case1_in = 0:5:255;
test_case2_in = 0:1/8:255;
test_case3_in = 0:1/1024:255;

test_case1_out = resGen(test_case1_in);
test_case2_out = resGen(test_case2_in);
test_case3_out = resGen(test_case3_in);

lut = arctan_lut_gen(18);

input_angle = -0.5;
res_x = cordic(lut, input_angle);

fprintf("input = %f\n", input_angle);
fprintf("cos = %f\n", res_x);

loop_count = 20;
MSE_out = fi(zeros(loop_count, 1), 1, 64, 61);
confidence_level_count = 0;

for j = 1:loop_count
    iter_count = 50;
    random_in = fi(zeros(iter_count, 1), 1, 64, 60);
    random_out = fi(zeros(iter_count, 1), 1, 64, 60);

    for i = 1:iter_count
        random_in(i,1) = -1 + 2 * rand();
        random_out(i, 1) = cordic(lut, random_in(i, 1));
    end

    [MSE_out(j), expe] = Monte_Carlo_run(random_out, random_in);
end

for i = 1:loop_count
    if MSE_out(i) <= fi(1*10^(-10), 1, 64, 60)
        confidence_level_count  = confidence_level_count + 1;
    end
end

confidence_level = confidence_level_count/loop_count;

MSE_mean = mean(MSE_out);
 
fprintf("MSE = %f\n", MSE_mean);
fprintf("confidence level count = %f\n", confidence_level_count);
fprintf("confidence level = %f\n", confidence_level);