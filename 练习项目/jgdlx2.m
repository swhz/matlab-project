k=[13.685767687402207,23.646319543193890,38.693925901790678,58.646363300365770];
for i=1:4
    l1=sqrt(k(i)-pi^2);
    l2=sqrt(k(i)+pi^2);
    f(i)=2*l1*l2*(cos(2*l1)*cosh(2*l2)-1)+(l1^2-l2^2)*sin(2*l1)*sinh(2*l2);
end
f