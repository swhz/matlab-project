function tx= gseidel( A,b,imax,x0,tol)%利用Gauss-Seidel迭代法解线性方程组
%AX=b，迭代初值为x0，迭代次数由imax提
%供，精确度由tol提供
del=10^-10; %主对角的元素不能太小，必须大于del 
tx=[x0]; n=length(x0); 
for i=1:n 
dg=A(i,i); 
if abs(dg)< del 
disp('diagonal element is too small'); 
return 
end 
end 
for k = 1:imax %Gauss-Seidel迭代法的运算循环体开始
x=x0; 
for i = 1:n 
sm=b(i); 
for j = 1:n 
if j~=i 
sm = sm -A(i,j)*x(j); 
end 
end 
x(i)=sm/A(i,i); 
end 
tx=[tx;x]; %将本次迭代得到的近似解存入变量tx中
if norm(x-x0)<tol 
return 
else 
x0=x; 
end 
end  % Gauss-Seidel迭代法的运算循环体结束 

