function tx = sor( A,b,imax,x0,tol,w)  %����Gauss-Seidel�����������Է�����
%AX=b��������ֵΪx0������������imax 
%�ṩ����ȷ����tol�ṩ��wΪ�ɳ�����
del=10^-10; %���Խǵ�Ԫ�ز���̫С���������del 
tx=[x0] ; n=length(x0); 
for i=1:n 
dg=A(i,i); 
if abs(dg)< del 
disp('diagonal element is too small'); 
return 
end 
end 
for k = 1:imax %SOR������������ѭ���忪ʼ
x=x0 ; 
for i = 1:n 
    sm=b(i); 
for j = 1:n 
if j~=i 
sm = sm -A(i,j)*x(j); 
end 
end 
x(i)=sm/A(i,i);   %���ε����õ��Ľ��ƽ�
x(i)=w*x(i)+(1-w)*x0(i); 
end 
tx=[tx;x];     %�����ε����õ��Ľ��ƽ�������tx��
if norm(x-x0)<tol 
return 
else 
x0=x; 
end 
end  %SOR������������ѭ�������
