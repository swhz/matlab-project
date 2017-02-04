function A=myhilb(n,m)
%A=myhilb(n,m)生成一个n*m阶希尔伯特矩阵
%A=myhilb(n)生成一个n*n阶希尔伯特矩阵
%myhilb(n,m)显示一个n*m阶希尔伯特矩阵
if nargin ==1,m=n;
elseif  nargin ==0 || nargin>2,
error('wrong number of input argments');
end
for i=1:n
for j=1:m
A1(i,j)=1/(i+j-1); %计算矩阵元素
end
end
if nargout ==1
A=A1;    %将数据传递给输出变量
elseif nargout ==0
format rat,disp(A1);  %以分数形式显示矩阵
end 


end

