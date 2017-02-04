clear
f=sym('y-12*x^2/y^3');
a=0; b=2;
h=0.1;
n=(b-a)/h+1;
x=0; y=1;
szj=[x,y];
for i=1:n-1
    y=y+h*subs(f,{'x','y'},{x,y});
    x=x+h;
    szj=[szj;x,y];
end
szj
hold on
plot(szj(:,1),szj(:,2),'ok-')
