clear
f=sym('y-12*x^2/y^3');
a=0; b=2; 
h=0.1;
n=(b-a)/h+1;
x=0; y=1;
szj=[x,y];
for i=1:n-1
    l1=subs(f,{'x','y'},{x,y});
    l2=subs(f,{'x','y'},{x+h/2,y+l1*h/2});
    l3=subs(f,{'x','y'},{x+h/2,y+l2*h/2});
    l4=subs(f,{'x','y'},{x+h,y+l3*h});
    y=y+h*(l1+2*l2+2*l3+l4)/6;
    x=x+h;
    szj=[szj;x,y];
end