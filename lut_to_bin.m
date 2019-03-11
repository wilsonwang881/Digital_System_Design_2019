% the function is used to get the binary values
% of the fixed-point numbers in the look up table
function lut_bin = lut_to_bin(lut_fi)

length = size(lut_fi, 1);
lut_bin = zeros(length, 1);
fileID = fopen('Look_Up_Table.txt', 'w');

for i = 1:length
    dummy = lut_fi(i, 1);
    fprintf("binary representation of %s is 32'b%s\n", dummy.data, dummy.bin);
    fprintf(fileID, "binary representation of %s is 32'b%s\n", dummy.data, dummy.bin);
end

fclose(fileID);