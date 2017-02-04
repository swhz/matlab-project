function tx=jacobi(A,b,imax,x0,tol)  %����jacobi�����������Է�����AX=b����
%����ֵΪx0������������imax�ṩ����ȷ
%����tol�ṩ
del=10^-10; %���Խǵ�Ԫ�ز���̫С���������del 
tx=[x0] ; n=length(x0); 
for i=1:n 
dg=A(i,i); 
if abs(dg)< del 
disp('diagonal element is too small'); 
return 
end 
end 
for k = 1:imax     %Jacobi������������ѭ���忪ʼ
for i = 1:n 
sm=b(i) ; 
for j = 1:n 
if j~=i 
sm = sm -A(i,j)*x0(j) ; 
end 
end %for j 
x(i)=sm/A(i,i) ; %���ε����õ��Ľ��ƽ�
end 
tx=[tx ;x] ; %�����ε����õ��Ľ��ƽ�������tx��
if norm(x-x0)<tol 
return 
else 
x0=x ; 
end 
end %Jacobi������������ѭ�������

