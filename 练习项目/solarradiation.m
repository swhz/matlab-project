function Ia=solarradiation(ts,b,p)
%该函数计算表面总辐射强度
A=1085;
B=0.207;
c=0.136;
CN=0.678;
e=-6;%时差
d=(20.6*pi)/180;%(太阳赤纬）
l=114+20/60;%当地经度
ls=120;%标准时对应经度
f=(30+37/60)*pi/180;%当地纬度（转化成弧度）
w=(ts+(l-ls)/15+e/60-12)*15;%太阳时角
w=(w*pi)/180;%将度转化为弧度
h=asin(sin(d)*sin(f)+cos(d)*cos(f)*cos(w));%计算太阳高度角
s1=sin(w)*cos(d)/cos(h);
c1=(sin(f)*sin(h)-sin(d))/(cos(f)*cos(h));
if c1>=0
       a=asin(sin(w)*cos(d)/cos(h));
   else
       if s1>=0
           a=pi-asin(sin(w)*cos(d)/cos(h));
       else
           a=-pi-asin(sin(w)*cos(d)/cos(h));
       end
end
r=abs(a-b);%计算墙面方位角,b表示墙面方位角
i=acos(sin(h)*cos(p)+cos(h)*sin(p)*cos(r));%计算表面太阳光线入射角，p表示墙面倾角
   if r>=pi/2&&(2*pi-r)>=pi/2
       i=pi/2;
   end
   if p==0
       i=acos(sin(h));
   end
Fg=0.5*(1-cos(p));
Fs=1-Fg;
Idn=A*CN*exp(-B/sin(h));%计算太阳直射辐射强度
if h<=0
    Idn=0;
end
Idnm=Idn*cos(i);%计算表面太阳直射辐射强度
Ids=c*Idn;%计算天空散射辐射强度
Idsm=Ids*Fs;%计算表面天空散射辐射强度
Idg=pg*Idn*(c+sin(h));%计算地面散射辐射
Idgm=Idg*Fg;%计算表面地面散射辐射强度
Ia=Idnm+Idsm+Idgm;%表面总辐射强度


end

