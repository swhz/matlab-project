x=0;
x1=0.1;
l1=sqrt(14-pi^2);
while abs(x-x1)>1.0e-2
x=x1;    
l2=sqrt(l1^2+2*pi^2);
l1=((l2^2-l1^2)*sin(2*l1)*sinh(2*l2))/(2*l2*(cos(2*l1)*cosh(2*l2)-1));
x1=l1;
end
x1