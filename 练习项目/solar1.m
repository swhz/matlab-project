b=0;
p=0;
A=1085;
B=0.207;
c=0.136;
CN=0.678;
pg=0.32;
I1=[];
I2=[];
I3=[];
I4=[];
t=0:24;
e=-6;%时差
d=(20.6*pi)/180;%(太阳赤纬）
l=114+20/60;%当地经度
ls=120;%标准时对应经度
f=(30+37/60)*pi/180;%当地纬度（转化成弧度）
for i=0:24
   ts=i; 
   ts
   w=(ts+(l-ls)/15+e/60-12)*15;%太阳时角
   w=(w*pi)/180;%将度转化为弧度
   h=asin(sin(d)*sin(f)+cos(d)*cos(f)*cos(w));%计算太阳高度角
   s1=sin(w)*cos(d)/cos(h);
   c1=(sin(f)*sin(h)-sin(d))/(cos(f)*cos(h));
   c2=-(cos(w)*cos(d)*sin(f)-sin(d)*cos(f))/cos(h);
   %if w<0
    %   a=acos(c2);
   %else
    %   a=2*pi-acos(c2);
   %end
   if c1>=0
       a=asin(sin(w)*cos(d)/cos(h));
   else
       if s1>=0
           a=pi-asin(sin(w)*cos(d)/cos(h));
       else
           a=-pi-asin(sin(w)*cos(d)/cos(h));
       end
   end
   a1=a*180/pi
   r=abs(a-b);%计算墙面方位角,b表示墙面方位角
   i=acos(sin(h)*cos(p)+cos(h)*sin(p)*cos(r));%计算表面太阳光线入射角，p表示墙面倾角
   if r>=pi/2&&(2*pi-r)>=pi/2
       i=pi/2;
   end
   if p==0
       i=acos(sin(h));
   end
   %i=i*180/pi
   Fg=0.5*(1-cos(p));
   Fs=1-Fg;
   Idn=A*CN*exp(-B/sin(h));%计算太阳直射辐射强度
   if h<=0
    Idn=0;
   end
   Idnm=Idn*cos(i);%计算表面太阳直射辐射强度
   I1=[I1,Idnm];
   Ids=c*Idn;%计算天空散射辐射强度
   Idsm=Ids*Fs;%计算表面天空散射辐射强度
   I2=[I2,Idsm];
   Idg=pg*Idn*(c+sin(h));%计算地面散射辐射
   Idgm=Idg*Fg;%计算表面地面散射辐射强度
   I3=[I3,Idgm];
   Ia=Idnm+Idsm+Idgm;%表面总辐射强度
   I4=[I4,Ia];
end
plot(t,I1,'k',t,I2,'r',t,I3,'g',t,I4,'b')