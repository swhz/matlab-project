EPS=1;
for n=1:100
    EPS=EPS/2;
    if (1+EPS)<=1
        EPS=EPS*2;
        break
    end
end
num=n-1
EPS

