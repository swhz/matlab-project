function A=myhilb(n,m)
%A=myhilb(n,m)����һ��n*m��ϣ�����ؾ���
%A=myhilb(n)����һ��n*n��ϣ�����ؾ���
%myhilb(n,m)��ʾһ��n*m��ϣ�����ؾ���
if nargin ==1,m=n;
elseif  nargin ==0 || nargin>2,
error('wrong number of input argments');
end
for i=1:n
for j=1:m
A1(i,j)=1/(i+j-1); %�������Ԫ��
end
end
if nargout ==1
A=A1;    %�����ݴ��ݸ��������
elseif nargout ==0
format rat,disp(A1);  %�Է�����ʽ��ʾ����
end 


end

