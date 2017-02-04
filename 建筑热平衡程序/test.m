tr=26;
t=zeros(8,24);
to=zeros(8,24);
ar=zeros(1,8);
B=zeros(8,1);
S=[12.6 6.44 12.6 7 12.6 12.6 2.56 2];
V=4.2*3*3;
La=[5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5];
La=La+5;
N=6.7/(6.7+22);
SC=0.949+0.159*N;%修正系数
SCo=1;%外遮阳系数
SCi=1;%内遮阳系数
SHGF=[0 0 0 0 0 14 40 63 85 121 155 167 155 127 85 63 40 14 0 0 0 0 0 0];%日射得热因素
%SHGF=zeros(1,24);
S7=1.6*1.6*0.85;%窗户有效面积
SHG=SC*SCo*SCi*SHGF*S7;%由窗户进入的室内得热
nl=[0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 1 1 1 0 0];%灯光使用系数
%nl=zeros(1,24);
nh=[1 1 1 1 1 1 1 0 0 0 0 0 0 0 0 0 1 1 1 1 1 1 1 1];%各时段人员数量
%nh=zeros(1,24);
Pl=80;%灯光功率
HGc=nl*1.2*Pl;%灯光散热
HGbs=nh*(53+(24-tr)*3.4);%人员散热
Wb=nh*0.001*49/0.6;%人员散湿
%HGas=[50 50 50 50 50 50 150 50 50 50 50 50 50 50 50 50 150 150 150 150 150 150 50 50];%其它设备散热
HGas=zeros(1,24);
Cs=0.05;%太阳辐射对流百分比
Cl=0.5;%灯光对流百分比
Cb=0.6;%人员散热对流百分比
Ca=0.5;%设备对流百分比
SA=4.2*3*4+3*3*2;%围护结构内表面总面积
qir=(SHG*(1-Cs)+HGc*(1-Cl)+HGbs*(1-Cb)+HGas*(1-Ca))/SA;%围护结构内表面辐射得热量
%qir=zeros(1,24);
q1c=HGc*Cl+HGbs*Cb+HGas*Ca;
%q1c=zeros(1,24);
q2c=zeros(1,24);
%q2c=[20 20 20 20 20 20 20 10 10 10 10 10 10 10 10 10 20 20 20 20 20 20 20 20];
W=Wb;%房间内扰散湿量
%W=zeros(1,24);
ac=[1.8 1.8 1.8 1.8 2.3 2.3 1.8 1.8];%围护结构内表面对流换热系数
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
%计算围护结构1的各参数
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
%计算围护结构2的各参数
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
%计算围护结构3的各参数
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
%计算围护结构4的各参数
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
%计算围护结构5的各参数
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
%计算围护结构6的各参数
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
%计算围护结构7的各参数
for i=1:24
    b=0;
    p=pi/2;
    a=0.131;
    Ia=so(i,b,p);
    to(7,i)=satp(i,p,a,Ia);
end
%计算围护结构8的各参数
for i=1:24
    b=pi;
    p=pi/2;
    a=0.73;
    Ia=so(i,b,p);
    to(8,i)=satp(i,p,a,Ia);
end
%计算空气单位热容、室外空气温度
ta=zeros(1,24);
cp=zeros(1,24);
for i=1:24
    ta(i)=satp(i,1,0,0);
    cp(i)=1.005*(353.2/(ta(i)+273));
end
A=Far(tr);
for i=1:8
    for j=1:8
        ar(j)=ar(j)+A(j,i);
    end
end
for i=1:6
    A(i,i)=-(ac(i)+ar(i)+Zi(i,1));
end
a7=ac(7)+ar(7);
a8=ac(8)+ar(8);
A(7,7)=-(a7+k7*a7/(a7-k7));
A(8,8)=-(a8+k8*a8/(a8-k8));
for k=1:50
for i=1:24
    n=i;
    for m=1:6
    bb=-qir(n)-ac(m)*tr;
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
    B(7,1)=-qir(n)-ac(7)*tr-to(7,n)*a7*k7/(a7-k7);
    B(8,1)=-qir(n)-ac(8)*tr-to(8,n)*a8*k8/(a8-k8);
    Ti=A\B;
    for ii=1:8
        t(ii,n)=Ti(ii);
    end
end
end
CLs=zeros(1,24);
for i=1:24
    cl=q1c(i)-q2c(i)+(La(i)*cp(i)*(ta(i)-tr))/3.6;
    for k=1:8
        cl=cl+S(k)*ac(k)*(t(k,i)-tr);
    end
    CLs(i)=cl;
end
da=zeros(1,24);
ML=zeros(1,24);
CLl=zeros(1,24);
dr=hd(tr,0.6);
h11=2510;
for i=1:24
    da(i)=hd(ta(i),0.8);
    ML(i)=W(i)+La(i)*(cp(i)/1.005)*(da(i)-dr);
    CLl(i)=ML(i)*h11/3.6;
end
CL=CLs+CLl;
%--------------------------------------

    
%-------------------------------------
x=1:24;
hold on;
grid on
%plot(x,CL,'k');
plot(x,CLs,'k');
%plot(x,CLl,'b');
%plot(x,HE,'g');
%plot(x,dtr);
%plot(x,ta,'y');
%plot(x,t(5,:),'k-o',x,t(6,:),'r-+',x,t(7,:),'g-s',x,t(8,:),'b-p');
xlabel('时刻（单位：h）');
%ylabel('温度（单位：℃）');
ylabel('负荷（单位：W）');
%legend('天花板','地板','窗户','门');

