n=4;
a=(n*pi)/2.0;
v=0.25;
for i=240:1.0e-2:250
    k=i;
    l1=sqrt(k-a^2);
    l2=sqrt(k+a^2);
    b1=-l1^2-v*a^2;
    b2=l2^2-v*a^2;
    f=2*l1*l2*((b1*b2)^2)*(cos(l1)*cosh(l2)-1)+((b2^4)*l1^2-(b1^4)*l2^2)*sin(l1)*sinh(l2);
    if abs(f)<1.0e3
        f
        k
    end
    hold on
    plot(k,f)
    grid on
end