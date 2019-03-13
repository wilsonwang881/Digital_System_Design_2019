# Digital_System_Design_2019

Coursework for DSD

Based on CORDIC algorithm, using bit shifting, adding, subtraction and look up table

Use Monte Carlo simulation technique

## Expected Precision

Mean square error (MSE) of 1*e-10

Confidence level of 95%

## Fixed Point Format

32-bit long

1 bit for sign

1 bits for integer parts

30 bits for decimal places

## Look Up Table

The length is being changed to find the optimum with the best precision

Currently, the length is 16

## arctan_lut_gen

For generating the look up table

Input: a number indicating the length of the table

Output: the look up table

## cordic

Calculate sine or cosine

Input: a look up table, the input number in radians

Output: the cosine or the sine value

## K_gen

Used for generating the K value

The K value is for scaling the result from the CORDIC algorithm

Input: a look up table

Output: the K value, in fixed-point format

## lut_to_bin

Used for getting the binary representation of the look up table

Input: a look up table, in fixed-number format

Output: the look up table, in binary representation, also a txt file storing the information

## Monte_Carlo_run

Used as part of the Monte Carlo simulation techinique

Input: an array of inputs, an array of the corresponding CORDIC-processed results

Output: the mean square error (MSE) of the CORDIC-processed results, compared with the standard cosine processed results

## project_1

Flow control, run each functions in a series

## resGen

Generate the standard MATLAB results of different test cases

## fi_to_float_converter

Convert fixed-point numbers to float numbers
