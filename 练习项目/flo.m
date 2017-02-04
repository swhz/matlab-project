function z=flo(t,y)
A=[-10 10 0;
       28 -1 -y(1);
       0 y(1) -8/3];
z=A*y;
end

