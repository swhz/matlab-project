x=-30:0.1:0; 
a=0.004/1.4;
y1=(15-x)/(a+1.0/2)-100; %h0=2
y2=(15-x)/(a+1.0/20)-100; %h0=20
y3=(15-x)/(a+1.0/65)-100; %h0=65
y4=(15-x)/(a+1.0/100)-100; %h0=100
plot(x,y1,'k',x,y2,'r',x,y3,'g',x,y4,'b');
legend('h0=2','h0=20','h0=65','h0=100')
xlabel('exterior (ambient) air temperature');
ylabel('electrical power');