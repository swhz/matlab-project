digits(25);
aa=vpa(248);
b=vpa(249);
n=4;
a=vpa((n*pi)/2.0);
v=0.25;
while abs(vpa((aa-b)))>=1.0e-20
    k=vpa(aa);
    l1=vpa(sqrt(k-a^2));
    l2=vpa(sqrt(k+a^2));
    b1=vpa(-l1^2-v*a^2);
    b2=vpa(l2^2-v*a^2);
    f1=vpa(2*l1*l2*((b1*b2)^2)*(cos(l1)*cosh(l2)-1)+((b2^4)*l1^2-(b1^4)*l2^2)*sin(l1)*sinh(l2));
    k=vpa(b);
    l1=vpa(sqrt(k-a^2));
    l2=vpa(sqrt(k+a^2));
    b1=vpa(-l1^2-v*a^2);
    b2=vpa(l2^2-v*a^2);
    f2=vpa(2*l1*l2*((b1*b2)^2)*(cos(l1)*cosh(l2)-1)+((b2^4)*l1^2-(b1^4)*l2^2)*sin(l1)*sinh(l2));
    c=vpa((aa+b)/2.0);
    k=vpa(c);
    l1=vpa(sqrt(k-a^2));
    l2=vpa(sqrt(k+a^2));
    b1=vpa(-l1^2-v*a^2);
    b2=vpa(l2^2-v*a^2);
    f3=vpa(2*l1*l2*((b1*b2)^2)*(cos(l1)*cosh(l2)-1)+((b2^4)*l1^2-(b1^4)*l2^2)*sin(l1)*sinh(l2));
    if f1*f3<0
        b=c;
    end
    if f2*f3<0
        aa=c;
    end
end
vpa(c)
vpa(f3)