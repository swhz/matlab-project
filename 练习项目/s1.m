b=0;
p=pi/2;
e=-6;%时差
d=(20.6*pi)/180;%(太阳赤纬）
l=114+20/60;%当地经度
ls=120;%标准时对应经度
f=(30+37/60)*pi/180;%当地纬度（转化成弧度）
for i=0:0.05:24
   ts=i; 
   w=(ts+(l-ls)/15+e/60-12)*15;%太阳时角
   w=(w*pi)/180;%将度转化为弧度
   h=asin(sin(d)*sin(f)+cos(d)*cos(f)*cos(w));%计算太阳高度角
   a=asin(sin(w)*cos(d)/cos(h));%计算太阳方位角
   if abs(a+pi/2)<0.005
       t1=ts
   end
   if abs(a-pi/2)<0.005
       t2=ts
   end
end
