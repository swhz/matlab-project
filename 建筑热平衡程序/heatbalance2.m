tr=zeros(1,24);
%tr=tr+26;
t=zeros(8,24);
to=zeros(8,24);
% ar=zeros(1,8);
B=zeros(9,1);
S=[12.6 6.44 12.6 7 12.6 12.6 2.56 2];
V=4.2*3*3;
La=[5 5 5 5 5 5 5 10 10 10 10 10 10 10 10 10 5 5 5 5 5 5 5 5];
La=La+20;
%La=zeros(1,24);
HEs=zeros(1,24);
N=6.7/(6.7+22);
SC=0.949+0.159*N;%����ϵ��
SCo=1;%������ϵ��
SCi=1;%������ϵ��
SHGF=[0 0 0 0 0 14 40 63 85 121 155 167 155 127 85 63 40 14 0 0 0 0 0 0];%�����������
S7=1.6*1.6*0.85;%������Ч���
SHG=SC*SCo*SCi*SHGF*S7;%�ɴ�����������ڵ���
nl=[0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 1 1 1 0 0];%�ƹ�ʹ��ϵ��
nh=[1 1 1 1 1 1 1 0 0 0 0 0 0 0 0 0 1 1 1 1 1 1 1 1];%��ʱ����Ա����
Pl=80;%�ƹ⹦��
HGc=nl*1.2*Pl;%�ƹ�ɢ��
HGbs=nh*(53+(24-32)*3.4);%��Աɢ��
HGas=[50 50 50 50 50 50 150 50 50 50 50 50 50 50 50 50 150 150 150 150 150 150 50 50];%�����豸ɢ��
Cs=0.05;%̫����������ٷֱ�
Cl=0.5;%�ƹ�����ٷֱ�
Cb=0.6;%��Աɢ�ȶ����ٷֱ�
Ca=0.5;%�豸�����ٷֱ�
SA=4.2*3*4+3*3*2;%Χ���ṹ�ڱ��������
qir=(SHG*(1-Cs)+HGc*(1-Cl)+HGbs*(1-Cb)+HGas*(1-Ca))/SA;%Χ���ṹ�ڱ�����������
%qir=zeros(1,24);
%q1c=HGc*Cl+HGbs*Cb+HGas*Ca;
q1c=zeros(1,24);
q2c=zeros(1,24);
%q2c=[20 20 20 20 20 20 20 10 10 10 10 10 10 10 10 10 20 20 20 20 20 20 20 20];
W=zeros(1,24);%��������ɢʪ����Ԥ��Ϊ0
ac=[1.8 1.8 1.8 1.8 2.3 2.3 1.8 1.8];%Χ���ṹ�ڱ����������ϵ��
k7=5.1*0.75;
k8=1.8;
s=1;
FG=re(s);
si=size(FG);
sis=si(2)/3;
X=zeros(1,sis);
Y=zeros(1,sis);
Z=zeros(1,sis);
Xi=zeros(8,sis);
Yi=zeros(8,sis);
Zi=zeros(8,sis);
for i=1:sis
    X(i)=FG(i);
    Y(i)=FG(i+sis);
    Z(i)=FG(i+2*sis);
end
%����Χ���ṹ1�ĸ�����
for i=1:24
    b=-pi/2;
    p=pi/2;
    a=0.73;
    Ia=so(i,b,p);
    to(1,i)=satp(i,p,a,Ia);
    Xi(1,:)=X;
    Yi(1,:)=Y;
    Zi(1,:)=Z;
end
%����Χ���ṹ2�ĸ�����
for i=1:24
    b=0;
    p=pi/2;
    a=0.73;
    Ia=so(i,b,p);
    to(2,i)=satp(i,p,a,Ia);
    Xi(2,:)=X;
    Yi(2,:)=Y;
    Zi(2,:)=Z;
end
%����Χ���ṹ3�ĸ�����
for i=1:24
    b=pi/2;
    p=pi/2;
    a=0.73;
    Ia=so(i,b,p);
    to(3,i)=satp(i,p,a,Ia);
    Xi(3,:)=X;
    Yi(3,:)=Y;
    Zi(3,:)=Z;
end
%����Χ���ṹ4�ĸ�����
for i=1:24
    b=pi;
    p=pi/2;
    a=0.73;
    Ia=so(i,b,p);
    to(4,i)=satp(i,p,a,Ia);
    Xi(4,:)=X;
    Yi(4,:)=Y;
    Zi(4,:)=Z;
end
%����Χ���ṹ5�ĸ�����
for i=1:24
    b=0;
    p=0;
    a=0.73;
    Ia=so(i,b,p);
    to(5,i)=satp(i,p,a,Ia);
    Xi(5,:)=X;
    Yi(5,:)=Y;
    Zi(5,:)=Z;
end
%����Χ���ṹ6�ĸ�����
for i=1:24
    b=0;
    p=0;
    a=0.73;
    Ia=0;
    to(6,i)=satp(i,p,a,Ia);
    Xi(6,:)=X;
    Yi(6,:)=Y;
    Zi(6,:)=Z;
end
%����Χ���ṹ7�ĸ�����
for i=1:24
    b=0;
    p=pi/2;
    a=0.131;
    Ia=so(i,b,p);
    to(7,i)=satp(i,p,a,Ia);
end
%����Χ���ṹ8�ĸ�����
for i=1:24
    b=pi;
    p=pi/2;
    a=0.73;
    Ia=so(i,b,p);
    to(8,i)=satp(i,p,a,Ia);
end
%���������λ���ݡ���������¶�
ta=zeros(1,24);
cp=zeros(1,24);
cpr=zeros(1,24);
for i=1:24
    ta(i)=satp(i,1,0,0);
    cp(i)=1.005*(353.2/(ta(i)+273));
end
for k=1:50
for ii=1:24
    n=ii;
    A=Far(tr(n));
    As=zeros(9,9);
    ar=zeros(1,8);
    for i=1:8
      for j=1:8
        ar(j)=ar(j)+A(j,i);
        As(i,j)=A(i,j);
      end
      As(9,i)=S(i)*ac(i);
      As(i,9)=ac(i);
      As(9,9)=As(9,9)-As(9,i);
    end
    for i=1:6
      As(i,i)=-(ac(i)+ar(i)+Zi(i,1));
    end
    a7=ac(7)+ar(7);
    a8=ac(8)+ar(8);
    As(7,7)=-(a7+k7*a7/(a7-k7));
    As(8,8)=-(a8+k8*a8/(a8-k8));
    cpr(n)=1.005*(353.2/(tr(n)+273));
    As(9,9)=As(9,9)-La(n)*cp(n)/3.6-V*cpr(n)/3.6;
    for m=1:6
    bb=-qir(n);
    for j=1:sis
        ys=mod(j-n,24);
        u=(j-n-ys)/24;
        if 24*u+n-j<0
           bb=bb-Yi(m,j)*to(m,24*(u+1)+1+n-j);
        else
            bb=bb-Yi(m,j)*to(m,24*u+n-j+1);
        end
        if j>1
            if 24*u+n-j<0
                bb=bb+Zi(m,j)*t(m,24*(u+1)+1+n-j);
            else
                bb=bb+Zi(m,j)*t(m,24*u+n-j+1);
            end
        end
    end
    B(m,1)=bb;
    end
    B(7,1)=-qir(n)-to(7,n)*a7*k7/(a7-k7);
    B(8,1)=-qir(n)-to(8,n)*a8*k8/(a8-k8);
    if n==1
       B(9,1)=HEs(n)-q1c(n)+q2c(n)-La(n)*cp(n)*ta(n)/3.6-V*cpr(n)*tr(24)/3.6; 
    else
       B(9,1)=HEs(n)-q1c(n)+q2c(n)-La(n)*cp(n)*ta(n)/3.6-V*cpr(n)*tr(n-1)/3.6;
    end
    Ti=As\B;
    for ij=1:8
        t(ij,n)=Ti(ij);
    end
    tr(n)=Ti(9);
end
end
%------------------------------------------------------
% CLs=zeros(1,24);
% for i=1:24
%     cl=q1c(i)-q2c(i)+(La(i)*cp(i)*(ta(i)-tr))/3.6;
%     for k=1:8
%         cl=cl+S(k)*ac(k)*(t(k,i)-tr);
%     end
%     CLs(i)=cl;
% end
% da=zeros(1,24);
% ML=zeros(1,24);
% CLl=zeros(1,24);
% dr=hd(tr,0.6);
% h11=2510;
% for i=1:24
%     da(i)=hd(ta(i),0.8);
%     ML(i)=W(i)+La(i)*(cp(i)/1.005)*(da(i)-dr);
%     CLl(i)=ML(i)*h11/3.6;
% end
% CL=CLs+CLl;
 x=1:24;
% plot(x,CL);
 hold on
% plot(x,CLs);
% plot(x,CLl);
 plot(x,tr,'b');
 %plot(x,ta,'g');
 %plot(x,t);