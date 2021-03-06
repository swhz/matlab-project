function W=Mode(x,y,m,n)
%假设振型函数
a=2;b=1;v=0.25;
k1=[2.654054975668751e+01,6.533522747928700e+01,1.242454597864579e+02,2.030146728275037e+02];
 %特征方程的前四个根(n=1时)
k2=[3.717633906973677e+01,7.567757894624052e+01,1.340233348403980e+02,2.123626774514827e+02];
%特征方程的前四个根(n=2时)
k3=[5.231595913087037e+01,9.149950641827095e+01,1.496441344110644e+02,2.275925443079098e+02];
%特征方程的前四个根(n=3时)
k4=[7.155943711972614e+01,1.119812786281487e+02,1.704791648200378e+02,2.483040177076479e+02];
%特征方程的前四个根(n=4时)
l1=[sqrt(k1-(pi^2)/4.0);sqrt(k2-pi^2);sqrt(k3-(9/4)*pi^2);sqrt(k4-4*pi^2)]';
l2=[sqrt(k1+(pi^2)/4.0);sqrt(k2+pi^2);sqrt(k3+(9/4)*pi^2);sqrt(k4+4*pi^2)]';
b1=[(pi^2)/4-k1-v*(pi^2)/4;pi^2-k2-v*pi^2;(9/4)*pi^2-k3-v*(9/4)*pi^2;4*pi^2-k4-v*4*pi^2]';
b2=[(pi^2)/4+k1-v*(pi^2)/4;pi^2+k2-v*pi^2;(9/4)*pi^2+k3-v*(9/4)*pi^2;4*pi^2+k4-v*4*pi^2]';
Y=cos(l1(m,n)*y)-(b1(m,n)/b2(m,n))*cosh(l2(m,n)*y)+(sin(l1(m,n)*y)-(l1(m,n)*b2(m,n)/(l2(m,n)*b1(m,n)))*sinh(l2(m,n)*y))*((b1(m,n)*cosh(l2(m,n)*b)...
-b1(m,n)*cos(l1(m,n)*b))/(b1(m,n)*sin(l1(m,n)*b)-(l1(m,n)*b2(m,n)*b2(m,n)*sinh(l2(m,n)*b))/(b1(m,n)*l2(m,n))));
yy=0:0.0001:b;
X=cos(l1(m,n)*y)-(b1(m,n)/b2(m,n))*cosh(l2(m,n)*y)+(sin(l1(m,n)*y)-(l1(m,n)*b2(m,n)/(l2(m,n)*b1(m,n)))*sinh(l2(m,n)*y))*((b1(m,n)*cosh(l2(m,n)*b)...
-b1(m,n)*cos(l1(m,n)*b))/(b1(m,n)*sin(l1(m,n)*b)-(l1(m,n)*b2(m,n)*b2(m,n)*sinh(l2(m,n)*b))/(b1(m,n)*l2(m,n))));
xx=max(abs(feval(inline(X),yy)));
Y=Y/xx;%标准化振型函数
W=Y.*sin(n*pi/a*x);



end

