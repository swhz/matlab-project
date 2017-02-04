tr=26;
t=zeros(8,24,4);
to=zeros(8,24,4);
%ar=zeros(1,8);
B=zeros(8,1,4);
S=[12.6 6.44 12.6 7 12.6 12.6 2.56 2];
La=[5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5];
La=La+5;
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
W=Wb;
%W=zeros(1,24);%房间内扰散湿量，预设为0
ac=[1.8 1.8 1.8 1.8 2.3 2.3 1.8 1.8];%围护结构内表面对流换热系数
k7=5.1*0.75;
k8=1.8;
%--------------------------------
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
%---------------------------------
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
%---------------------------------
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
%--------------------------------------
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
to(1,:,1)=tr;
to(1,:,4)=tr;
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
to(3,:,2)=tr;
to(3,:,3)=tr;
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
to(5,:,3)=tr;
to(5,:,4)=tr;
%计算围护结构6的各参数
for i=1:24
    b=0;
    p=0;
    a=0.73;
    Ia=0;
    to(6,i,:)=satp(i,p,a,Ia);
end
to(6,:,1)=tr;
to(6,:,2)=tr;
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
%计算空气单位热容、室外空气温度
ta=zeros(1,24);
cp=zeros(1,24);
for i=1:24
    ta(i)=satp(i,1,0,0);
    cp(i)=1.005*(353.2/(ta(i)+273));
end
%----------------------------------------------------------------
%-----------房间1--------------
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
A=zeros(8,8,4);
CLs=zeros(4,24);
CLl=zeros(4,24);
%--------------------------------------
for ik=1:4
Aa=Far(tr);
ar=zeros(1,8);
for i=1:8
    for j=1:8
        ar(j)=ar(j)+Aa(j,i);
        A(i,j,ik)=Aa(i,j);
    end
end
for i=1:6
    A(i,i,ik)=-(ac(i)+ar(i)+Zi(i,1,ik));
end
a7=ac(7)+ar(7);
a8=ac(8)+ar(8);
A(7,7,ik)=-(a7+k7*a7/(a7-k7));
A(8,8,ik)=-(a8+k8*a8/(a8-k8));
for k=1:20
for i=1:24
    n=i;
    for m=1:6
    bb=-qir(n)-ac(m)*tr;
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
    B(7,1,ik)=-qir(n)-ac(7)*tr-to(7,n,ik)*a7*k7/(a7-k7);
    B(8,1,ik)=-qir(n)-ac(8)*tr-to(8,n,ik)*a8*k8/(a8-k8);
    Ak=A(:,:,ik);
    Bk=B(:,:,ik);
    Ti=Ak\Bk;
    for ii=1:8
        t(ii,n,ik)=Ti(ii);
    end
end
end
for i=1:24
    cl=q1c(i)-q2c(i)+(La(i)*cp(i)*(ta(i)-tr))/3.6;
    for k=1:8
        cl=cl+S(k)*ac(k)*(t(k,i,ik)-tr);
    end
    CLs(ik,i)=cl;
end
da=zeros(1,24);
ML=zeros(1,24);
dr=hd(tr,0.6);
h11=2510;
for i=1:24
    da(i)=hd(ta(i),0.8);
    ML(i)=W(i)+La(i)*(cp(i)/1.005)*(da(i)-dr);
    CLl(ik,i)=ML(i)*h11/3.6;
end
CL=CLs+CLl;
end
%---------------------------------------------------------------
x=1:24;
%plot(x,CL);
hold on
grid on
%plot(x,CL(1,:),'b-o',x,CL(2,:),'g-+',x,CL(3,:),'r-s',x,CL(4,:),'k-p');
plot(x,CLs);
%plot(x,ta);
%plot(x,t(8,:,1),'b-o',x,t(8,:,2),'g-+',x,t(8,:,3),'r-s',x,t(8,:,4),'k-p');
xlabel('时刻（单位：h）');
%ylabel('温度（单位：℃）');
ylabel('负荷（单位：W）');
legend('房间一','房间二','房间三','房间四');