clear
clc

% cos(1)
to_bin_converter(1);
input = '00100010100101000101000000011111';
to_float_converter(input);

% cos(-1)
to_bin_converter(-1);
input = '00100010100101000101000000100000';
to_float_converter(input);

% cos(0)
to_bin_converter(0)
input = '01000000000000000000000000000101';
to_float_converter(input);

% cos(0.66)
to_bin_converter(0.66);
input = '00110010100011110011101110001111';
to_float_converter(input);

% cos(0.2019)
to_bin_converter(0.2019);
input = '00111110101100110011001010000011';
to_float_converter(input);

% cos(-0.347837)
to_bin_converter(-0.347837);
input = '00111100001010101100110001100010';
to_float_converter(input);

input = '00111000001010100111100001010010';
to_float_converter(input);

input = '00100010';
to_float_converter(input);

function to_bin_converter(in_float)
    l = fi(in_float, 1, 32, 30);
    fprintf("float %s = bin %s\n", in_float, l.bin);
    fprintf("expected %f\n", single(cos(in_float)));
end

function to_float_converter(in_fi)
    res = single(0);
    
    if in_fi(2) == '1'
        res = res + 1;
    end

    for i = 3:32
        if in_fi(i) == '1'
            res = res + 2^(-i+2);
        end
    end
    
    if in_fi(1) == '1'
        res = -res;
    end

    fprintf("fi %s = float %f\n\n", in_fi, res);
end