clc,clear all;
a=2; b=1; h=0.01; E=210e9; v=0.25; d=7800; D=E*h^3/(12*(1-v^2));
f1=10; f2=2; f3=10;
xf=a/2; yf=b/2;
syms x y t;
for i=1:4
    for j=1:4
        W(4*(i-1)+j)=Mode(x,y,i,j);
        Wpx2(4*(i-1)+j)=diff(diff(W(4*(i-1)+j),x),x);
        Wpy2(4*(i-1)+j)=diff(diff(W(4*(i-1)+j),y),y);
        Wpxpy(4*(i-1)+j)=diff(diff(W(4*(i-1)+j),x),y);
        F(4*(i-1)+j)=integral2(matlabFunction(W(4*(i-1)+j)),0,a,0,b);
        Q(4*(i-1)+j)=(f1*cos(10*pi*t)+f2*cos(50*pi*t)+f3*cos(20*pi*t))*F(4*(i-1)+j);
    end
end
Q=Q';
M=zeros(16);K=M;
mn=1;
for i=1:16
    for j=1:16
        M(i,j)=d*integral2(matlabFunction(W(i)*W(j)),0,a,0,b);
       % k1=integral2(matlabFunction(Wpx2(i)*Wpx2(j)),0,a,0,b);
        %k2=integral2(matlabFunction(Wpy2(i)*Wpy2(j)),0,a,0,b);
        %k3=integral2(matlabFunction(Wpx2(i)*Wpy2(j)),0,a,0,b);
        %k4=integral2(matlabFunction(Wpy2(i)*Wpx2(j)),0,a,0,b);
        %k5=integral2(matlabFunction(Wpxpy(i)*Wpxpy(j)),0,a,0,b);
        k1=Wpx2(i)*Wpx2(j)+Wpy2(i)*Wpy2(j)+v*Wpx2(i)*Wpy2(j)+v*Wpy2(i)*Wpx2(j)+2*(1-v)*Wpxpy(i)*Wpxpy(j);
        %K(i,j)=D*k1+D*k2+D*v*k3+D*v*k4+D*2*(1-v)*k5;
        K(i,j)=D*integral2(matlabFunction(k1),0,a,0,b);
        mn=mn+1;
        mn
        K(i,j)
    end
end
[v,w]=eig(M\K);
omega=diag(w);
[Omega,I]=sort(omega,'ascend');
Omega=sqrt(Omega);
V=v(:,I(1:16));
W=W*V;
Mp=V'*M*V;  Mp=diag(diag(Mp));
Kp=V'*K*V;  Kp=diag(diag(Kp));
Qp=V'*Q;
Mp=diag(1./sqrt(diag(Mp)));
Qc=Mp*Qp;
Mc=V*Mp;
t=0:0.01:1;
for i=1:16
    qc(i,:)=conv(double(subs(Qc(i),t)),sin(Omega(i)*t))/Omega(i);
    z(i)=feval(matlabFunction(W(i)),xf,yf);
end
q=Mc*qc;
tt=linspace(0,1,size(q,2));
plot(tt,z*q);grid on
title('板中心点处的响应','fontsize',13,'fontweight','bold')
xlabel('t/s','fontsize',13,'fontweight','bold' )
