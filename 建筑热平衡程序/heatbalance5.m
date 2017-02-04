%---------------一个房间使用空调，其它三个房间不使用空调时的空调负荷计算------------------------
tr=zeros(4,24);%房间室温
di=4;%使用空调的房间编号
trt=26;%使用空调的房间的给定室温，这里室温不变
tr(di,:)=trt;
t=zeros(8,24,4);%各个房间各个围护结构的内表面温度
to=zeros(8,24,4);%各个房间各个围护结构的外表面综合温度
B=zeros(9,1,4);
S=[12.6 6.44 12.6 7 12.6 12.6 2.56 2];%各围护结构的面积
V=4.2*3*3;%房间体积
La=[5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5];%房间渗风与通风量
La=La+5;
HEs=zeros(1,24);%空调系统显热除热量，这里三个房间均为零
N=6.7/(6.7+22);
SC=0.949+0.159*N;%修正系数
SCo=1;%外遮阳系数
SCi=1;%内遮阳系数
SHGF=[0 0 0 0 0 14 40 63 85 121 155 167 155 127 85 63 40 14 0 0 0 0 0 0];%日射得热因素
S7=1.6*1.6*0.85;%窗户有效面积
SHG=SC*SCo*SCi*SHGF*S7;%由窗户进入的室内得热
nl=[0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 1 1 1 0 0];%灯光使用系数
nh=[1 1 1 1 1 1 1 0 0 0 0 0 0 0 0 0 1 1 1 1 1 1 1 1];%各时段人员数量
Pl=80;%灯光功率
HGc=nl*1.2*Pl;%灯光散热
HGbs=nh*(53+(24-26)*3.4);%人员散热
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
q1c=HGc*Cl+HGbs*Cb+HGas*Ca;%围护结构内表面对流散热量
%q1c=zeros(1,24);
q2c=zeros(1,24);
%q2c=[20 20 20 20 20 20 20 10 10 10 10 10 10 10 10 10 20 20 20 20 20 20 20 20];%水分蒸发耗热量
W=Wb;%房间内扰散湿量
ac=[1.8 1.8 1.8 1.8 2.3 2.3 1.8 1.8];%围护结构内表面对流换热系数
k7=5.1*0.75;%窗户传热系数
k8=1.8;%门的传热系数
%------------------求解1型墙体反应系数--------------------------------
s=1;
FG=re(s);
si=size(FG);
sis=si(2)/3;
X1=zeros(1,sis);
Y1=zeros(1,sis);
Z1=zeros(1,sis);
for i=1:sis
    X1(i)=FG(i);
    Y1(i)=FG(i+sis);
    Z1(i)=FG(i+2*sis);
end
%------------求解2型墙体反应系数--------------------------
s=2;
FG=re(s);
si=size(FG);
sis=si(2)/3;
X2=zeros(1,sis);
Y2=zeros(1,sis);
Z2=zeros(1,sis);
for i=1:sis
    X2(i)=FG(i);
    Y2(i)=FG(i+sis);
    Z2(i)=FG(i+2*sis);
end
%----------------求解三型墙体反应系数----------------------------
s=3;
FG=re(s);
si=size(FG);
sis=si(2)/3;
X3=zeros(1,sis);
Y3=zeros(1,sis);
Z3=zeros(1,sis);
for i=1:sis
    X3(i)=FG(i);
    Y3(i)=FG(i+sis);
    Z3(i)=FG(i+2*sis);
end
%-------------------------------------------------------
Xi=zeros(8,sis,4);
Yi=zeros(8,sis,4);
Zi=zeros(8,sis,4);
%计算围护结构1的各参数
for i=1:24
    b=-pi/2;
    p=pi/2;
    a=0.73;
    Ia=so(i,b,p);
    to(1,i,:)=satp(i,p,a,Ia);
end
%计算围护结构2的各参数
for i=1:24
    b=0;
    p=pi/2;
    a=0.73;
    Ia=so(i,b,p);
    to(2,i,:)=satp(i,p,a,Ia);
end
%计算围护结构3的各参数
for i=1:24
    b=pi/2;
    p=pi/2;
    a=0.73;
    Ia=so(i,b,p);
    to(3,i,:)=satp(i,p,a,Ia);
end
%计算围护结构4的各参数
for i=1:24
    b=pi;
    p=pi/2;
    a=0.73;
    Ia=so(i,b,p);
    to(4,i,:)=satp(i,p,a,Ia);
end
%计算围护结构5的各参数
for i=1:24
    b=0;
    p=0;
    a=0.73;
    Ia=so(i,b,p);
    to(5,i,:)=satp(i,p,a,Ia);
end
%计算围护结构6的各参数
for i=1:24
    b=0;
    p=0;
    a=0.73;
    Ia=0;
    to(6,i,:)=satp(i,p,a,Ia);
end
%计算围护结构7的各参数
for i=1:24
    b=0;
    p=pi/2;
    a=0.131;
    Ia=so(i,b,p);
    to(7,i,:)=satp(i,p,a,Ia);
end
%计算围护结构8的各参数
for i=1:24
    b=pi;
    p=pi/2;
    a=0.73;
    Ia=so(i,b,p);
    to(8,i,:)=satp(i,p,a,Ia);
end
%----------------------------------------------------
%计算空气单位热容、室外空气温度
ta=zeros(1,24);
cp=zeros(1,24);
cpr=zeros(1,24);
for i=1:24
    ta(i)=satp(i,1,0,0);
    cp(i)=1.005*(353.2/(ta(i)+273));
end
%--------------确定各个房间各个墙体的反应系数----------------------------
for j=1:4
  for i=1:6
    Xi(i,:,j)=X1;
    Yi(i,:,j)=Y1;
    Zi(i,:,j)=Z1;
  end
end
Xi(1,:,1)=X2;
Yi(1,:,1)=Y2;
Zi(1,:,1)=Z2;
Xi(6,:,1)=X3;
Yi(6,:,1)=Y3;
Zi(6,:,1)=Z3;
Xi(3,:,2)=X2;
Yi(3,:,2)=Y2;
Zi(3,:,2)=Z2;
Xi(6,:,2)=X3;
Yi(6,:,2)=Y3;
Zi(6,:,2)=Z3;
Xi(3,:,3)=X2;
Yi(3,:,3)=Y2;
Zi(3,:,3)=Z2;
Xi(5,:,3)=X3;
Yi(5,:,3)=Y3;
Zi(5,:,3)=Z3;
Xi(1,:,4)=X2;
Yi(1,:,4)=Y2;
Zi(1,:,4)=Z2;
Xi(5,:,4)=X3;
Yi(5,:,4)=Y3;
Zi(5,:,4)=Z3;
%---------------------求解不使用空调的三个房间的房间温度及围护结构内表面温度----------------------------------------
As=zeros(9,9,4);
for k=1:50
for ik=1:4
if abs(ik-di)>0    
for ii=1:24
    n=ii;
    A=Far(tr(ik,n));
    As(:,:,ik)=0;
    ar=zeros(1,8);
    for i=1:8
      for j=1:8
        ar(j)=ar(j)+A(j,i);
        As(i,j,ik)=A(i,j);
      end
      As(9,i,ik)=S(i)*ac(i);
      As(i,9,ik)=ac(i);
      As(9,9,ik)=As(9,9,ik)-As(9,i,ik);
    end
    for i=1:6
      As(i,i,ik)=-(ac(i)+ar(i)+Zi(i,1,ik));
    end
    a7=ac(7)+ar(7);
    a8=ac(8)+ar(8);
    As(7,7,ik)=-(a7+k7*a7/(a7-k7));
    As(8,8,ik)=-(a8+k8*a8/(a8-k8));
    cpr(n)=1.005*(353.2/(tr(ik,n)+273));
    As(9,9,ik)=As(9,9,ik)-La(n)*cp(n)/3.6-V*cpr(n)/3.6;
    for m=1:6
    bb=-qir(n);
    for j=1:sis
        ys=mod(j-n,24);
        u=(j-n-ys)/24;
        if 24*u+n-j<0
           bb=bb-Yi(m,j,ik)*to(m,24*(u+1)+1+n-j,ik);
        else
            bb=bb-Yi(m,j,ik)*to(m,24*u+n-j+1,ik);
        end
        if j>1
            if 24*u+n-j<0
                bb=bb+Zi(m,j,ik)*t(m,24*(u+1)+1+n-j,ik);
            else
                bb=bb+Zi(m,j,ik)*t(m,24*u+n-j+1,ik);
            end
        end
    end
    B(m,1,ik)=bb;
    end
    B(7,1,ik)=-qir(n)-to(7,n,ik)*a7*k7/(a7-k7);
    B(8,1,ik)=-qir(n)-to(8,n,ik)*a8*k8/(a8-k8);
    if n==1
       B(9,1,ik)=HEs(n)-q1c(n)+q2c(n)-La(n)*cp(n)*ta(n)/3.6-V*cpr(n)*tr(ik,24)/3.6; 
    else
       B(9,1,ik)=HEs(n)-q1c(n)+q2c(n)-La(n)*cp(n)*ta(n)/3.6-V*cpr(n)*tr(ik,n-1)/3.6;
    end
    Ak=As(:,:,ik);
    Bk=B(:,:,ik);
    Ti=Ak\Bk;
    for ij=1:8
        t(ij,n,ik)=Ti(ij);
    end
    tr(ik,n)=Ti(9);
end
to(1,:,1)=tr(2,:);
to(6,:,1)=tr(4,:);
to(3,:,2)=tr(1,:);
to(6,:,2)=tr(3,:);
to(3,:,3)=tr(4,:);
to(5,:,3)=tr(2,:);
to(1,:,4)=tr(3,:);
to(5,:,4)=tr(1,:);
end
end
end
%-------------------求解使用空调的房间的围护结构表面温度--------------------
A=Far(trt);
Bi=zeros(8,1);
ar=zeros(1,8);
for i=1:8
    for j=1:8
        ar(j)=ar(j)+A(j,i);
    end
end
for i=1:6
    A(i,i)=-(ac(i)+ar(i)+Zi(i,1,di));
end
a7=ac(7)+ar(7);
a8=ac(8)+ar(8);
A(7,7)=-(a7+k7*a7/(a7-k7));
A(8,8)=-(a8+k8*a8/(a8-k8));
for k=1:50
for i=1:24
    n=i;
    for m=1:6
    bb=-qir(n)-ac(m)*trt;
    for j=1:sis
        ys=mod(j-n,24);
        u=(j-n-ys)/24;
        if 24*u+n-j<0
           bb=bb-Yi(m,j,di)*to(m,24*(u+1)+1+n-j,di);
        else
            bb=bb-Yi(m,j,di)*to(m,24*u+n-j+1,di);
        end
        if j>1
            if 24*u+n-j<0
                bb=bb+Zi(m,j,di)*t(m,24*(u+1)+1+n-j,di);
            else
                bb=bb+Zi(m,j,di)*t(m,24*u+n-j+1,di);
            end
        end
    end
    Bi(m,1)=bb;
    end
    Bi(7,1)=-qir(n)-ac(7)*trt-to(7,n,di)*a7*k7/(a7-k7);
    Bi(8,1)=-qir(n)-ac(8)*trt-to(8,n,di)*a8*k8/(a8-k8);
    Ti=A\Bi;
    for ii=1:8
        t(ii,n,di)=Ti(ii);
    end
end
end
%-----------------------求解空调负荷，包括显热负荷与潜热负荷（湿负荷）------------------
CLs=zeros(1,24);%显热负荷
for i=1:24
    cl=q1c(i)-q2c(i)+(La(i)*cp(i)*(ta(i)-trt))/3.6;
    for k=1:8
        cl=cl+S(k)*ac(k)*(t(k,i,di)-trt);
    end
    CLs(i)=cl;
end
da=zeros(1,24);%室外空气含湿量
ML=zeros(1,24);%湿负荷
CLl=zeros(1,24);%潜热负荷
dr=hd(trt,0.6);%室内空气含湿量，这里室内相对湿度取60%
h11=2510;%水蒸气焓值
for i=1:24
    da(i)=hd(ta(i),0.8);
    ML(i)=W(i)+La(i)*(cp(i)/1.005)*(da(i)-dr);
    CLl(i)=ML(i)*h11/3.6;
end
CL=CLs+CLl;%总热负荷
%----------------------------------------------------
 x=1:24;
 %plot(x,CL,'b');
 hold on
 %plot(x,CLs,'g');
 plot(x,CL,'b-p');
 xlabel('时刻（单位：h）');
 ylabel('负荷（单位：W）');
 %plot(x,tr(4,:));
 %plot(x,ta,'y');
 %plot(x,t(6,:,3));
%plot(x,t(7,:,1),'b',x,t(7,:,2),'g',x,t(7,:,3),'r',x,t(7,:,4),'y');