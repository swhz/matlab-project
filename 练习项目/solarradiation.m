function Ia=solarradiation(ts,b,p)
%�ú�����������ܷ���ǿ��
A=1085;
B=0.207;
c=0.136;
CN=0.678;
e=-6;%ʱ��
d=(20.6*pi)/180;%(̫����γ��
l=114+20/60;%���ؾ���
ls=120;%��׼ʱ��Ӧ����
f=(30+37/60)*pi/180;%����γ�ȣ�ת���ɻ��ȣ�
w=(ts+(l-ls)/15+e/60-12)*15;%̫��ʱ��
w=(w*pi)/180;%����ת��Ϊ����
h=asin(sin(d)*sin(f)+cos(d)*cos(f)*cos(w));%����̫���߶Ƚ�
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
r=abs(a-b);%����ǽ�淽λ��,b��ʾǽ�淽λ��
i=acos(sin(h)*cos(p)+cos(h)*sin(p)*cos(r));%�������̫����������ǣ�p��ʾǽ�����
   if r>=pi/2&&(2*pi-r)>=pi/2
       i=pi/2;
   end
   if p==0
       i=acos(sin(h));
   end
Fg=0.5*(1-cos(p));
Fs=1-Fg;
Idn=A*CN*exp(-B/sin(h));%����̫��ֱ�����ǿ��
if h<=0
    Idn=0;
end
Idnm=Idn*cos(i);%�������̫��ֱ�����ǿ��
Ids=c*Idn;%�������ɢ�����ǿ��
Idsm=Ids*Fs;%����������ɢ�����ǿ��
Idg=pg*Idn*(c+sin(h));%�������ɢ�����
Idgm=Idg*Fg;%����������ɢ�����ǿ��
Ia=Idnm+Idsm+Idgm;%�����ܷ���ǿ��


end

