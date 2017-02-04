syms x1 x2 x3 x4 l1 l2;
f1=x2+x4;
f2=l1*x1+l2*x3;
f3=sin(l1)*x1+cos(l1)*x2+sinh(l2)*x3+cosh(l2)*x4;
f4=l1*cos(l1)*x1-l1*sin(l1)*x2+l2*cosh(l2)*x3+l2*sinh(l2)*x4;
[x1,x2,x3,x4]=solve(f1,f2,f3,f4,x1,x2,x3,x4)