clear
global mu;
mu=7;
y0=[1;0];
[t,x]=ode23('verderpol',[0,40],y0);
plot(t,x(:,1),'r-',t,x(:,2),'y-');
hold on;
[t,x]=ode45('verderpol',[0,40],y0);
plot(t,x(:,1),'k+',t,x(:,2),'b+');
legend('ode23','ode23','ode45','ode45');