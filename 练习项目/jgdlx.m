
for i=13.68:1.0e-6:13.69
    k=i;
    l1=sqrt(k-pi^2);
    l2=sqrt(k+pi^2);
    f=2*l1*l2*(cos(2*l1)*cosh(2*l2)-1)+(l1^2-l2^2)*sin(2*l1)*sinh(2*l2);
    hold on
    plot(k,f)
    grid on
end
