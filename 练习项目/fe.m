function [T] = fe(x)
%UNTITLED 此处显示有关此函数的摘要
%   此处显示详细说明

if x<0
    T=-20000*x^2-2000*x+55.36;
else
    T=35.36*exp(-sqrt(3200)*x)+20;
end
end

