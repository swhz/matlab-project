x0=input('输入初始迭代值x0=');
x1=x0+0.01;
while abs(x1-x0)>1.0e-07
    x0=x1;
    x1=x0-(x0^3-3*x0+1)/(3*x0*x0-3);
end
x1
