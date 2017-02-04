clear
f=0;
a=0; b=2;
h=0.1;
n=(b-a)/h+1;
x=0; y=1;
szj=[x,y];
for i=1:n-1
    f=y-12*x*x/y^3;
    y=y+h*f;
    x=x+h;
    szj=[szj;x,y];
end
szj
plot(szj(:,1),szj(:,2),'.g:')