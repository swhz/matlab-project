n=6;x=0:n;y=0:n;
for i=1:7
for j=1:7
    if i==j
          plot(x(i)*ones(size(y)),y); 
          xlabel('x');ylabel('y');title('AiBj的连线')
          v=[0,n,0,n];axis(v)
          hold on;
    else
          a=min(x(i),x(j)); b=max(x(i),x(j));
          X1=a:0.1*(b-a):b;
          Y1=-n/(x(i)-x(j))*(X1-x(i));%连接AiBj的直线
          plot(X1,Y1); 
    end   
end
end
