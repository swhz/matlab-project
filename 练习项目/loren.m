clear
y0=[1;1;1];
[t,y]=ode23('flo',[0,80],y0);
%M=moviein(800);
a=[];
b=[];
c=[];
for i=1:3064
    a=[a;y(i,1)];
    b=[b;y(i,2)];
    c=[c;y(i,3)];
    plot3(a,b,c);
    axis square
    pause(0.01)
    %M(:,i)=getframe;
end
%movie(M,10)