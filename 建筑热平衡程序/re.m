function FG = re(s)
%计算墙体反应系数
A=zeros(1,10);
B=zeros(1,10);
C=zeros(1,10);
D=zeros(1,10);
A9=zeros(1,100);
B9=zeros(1,100);
C9=zeros(1,100);
S=zeros(1,100);
X=zeros(1,100);
Y=zeros(1,100);
Z=zeros(1,100);
R=zeros(1,10);
G1=zeros(1,10);
G2=zeros(1,10);
G3=zeros(1,10);
G4=zeros(1,10);
W=1;
R0=0;
%B0=1;
if s==1
    R(1)=1/22;
elseif s==2
    R(1)=1/6.8;
else
    R(1)=1/7.3;
end
G1(2)=1.74;
G2(2)=0.92;
G3(2)=2500;
G4(2)=0.37;
G1(3)=0.7;
G2(3)=0.88;
G3(3)=1600;
G4(3)=0.02;
for i=1:3
    if R(i)==0
        G2(i)=G1(i)/G3(i)/G2(i)*3.6;
        G3(i)=G4(i);
        R0=R0+G3(i)/G1(i);
    end
    R0=R0+R(i);
end
K=1/R0;
Z5=sqrt(100);
G=0.1;
for j=1:40
    B0=1;
    while (abs(B0)>=1e-05)&&(W<=100)
    A0=1;
    B0=0;
    C0=0;
    D0=1;
    for i=1:3
        if R(i)==0
            Z1=sqrt(G1(i)*G1(i)/G2(i))*X(j);
            Y(i)=sqrt(G3(i)*G3(i)/G2(i))*X(j);
            A(i)=cos(Y(i));
            if Y(i)==0
                B(i)=G3(i)/G1(i);
            else
                B(i)=sin(Y(i))/Z1;
            end
            C(i)=-Z1*sin(Y(i));
            D(i)=A(i);
        else
            A(i)=1;
            B(i)=R(i);
            C(i)=0;
            D(i)=1;
        end
        E1=A0*A(i)+B0*C(i);
        E2=A0*B(i)+B0*D(i);
        E3=C0*A(i)+D0*C(i);
        E4=C0*B(i)+D0*D(i);
        A0=E1;
        B0=E2;
        C0=E3;
        D0=E4;
    end
    W=W+1;
    Z(W)=B0;
    E0=Z(W-1)-Z(W);
     H=Z(W);
     if abs(Z(W))-abs(Z(W-1))<0
         H=Z(W-1);
     end
     if abs(E0)>abs(H)
         G=-G/3;
     end
     X(j)=X(j)+G;
    end
    if X(j)>Z5
        break
    end
    S(j)=X(j)*X(j);
    G=0.1;
    W=1;
    X(j+1)=X(j)+G;
    for i=1:3
        if R(i)==0
           if S(j)==0
              X9=G3(i)*G3(i)*0.5/G2(i);
              A2=X9;
              B2=X9*G3(i)/G1(i)/3;
              C2=G1(i)/G3(i)*X9*2;
              D2=X9;
           else
               Z1=sqrt(S(j)/G2(i));
               Z2=Z1*G3(i);
               X9=G3(i)*G3(i)*0.5/G2(i);
               R1=G3(i)/G1(i);
               C4=sin(Z2);
               C5=cos(Z2);
               S1=C4/Z2;
               S2=(S1-C5)/Z2/Z2;
               A2=X9*S1;
               B2=X9*R1*S2;
               C2=X9*(S1+C5)/R1;
               D2=X9*S1;
           end
        else
            A2=0;
            B2=0;
            C2=0;
            D2=0;
        end
        if i==1
            A0=A(i);
            B0=B(i);
            C0=C(i);
            D0=D(i);
            A3=A2;
            B3=B2;
            C3=C2;
            D3=D2;
        else
            E1=A0*A(i)+B0*C(i);
            E2=A0*B(i)+B0*D(i);
            E3=C0*A(i)+D0*C(i);
            E4=C0*B(i)+D0*D(i);
            E5=A3*A(i)+A0*A2+B3*C(i)+B0*C2;
            E6=A3*B(i)+A0*B2+B3*D(i)+B0*D2;
            E7=C3*A(i)+C0*A2+D3*C(i)+D0*C2;
            E8=C3*B(i)+C0*B2+D3*D(i)+D0*D2;
            A0=E1;
            B0=E2;
            C0=E3;
            D0=E4;
            A3=E5;
            B3=E6;
            C3=E7;
            D3=E8;
        end
    end
        A9(j)=D0/B3;
        B9(j)=1/B3;
        C9(j)=A0/B3;
        S(j)=-S(j);
       % j
        %S(j)
end
M=j-1;
i=1;
%c5=1;
%while (c5-0.001)>0
for ii=1:100
  if i==1
      X(i)=K;
      Y(i)=K;
      Z(i)=K;
      for j=1:M
          A1=(1-exp(S(j)))/(S(j)*S(j));
          X(i)=X(i)-A9(j)*A1;
          Y(i)=Y(i)-B9(j)*A1;
          Z(i)=Z(i)-C9(j)*A1;
      end
  else
      X(i)=0;
      Y(i)=0;
      Z(i)=0;
      for j=1:M
          A1=-(1-exp(S(j)))*(1-exp(S(j)))*exp((i-2)*S(j))/S(j)/S(j);
          X(i)=X(i)-A9(j)*A1;
          Y(i)=Y(i)-B9(j)*A1;
          Z(i)=Z(i)-C9(j)*A1;
      end
  end
  %if i<1.0015
   %   Y(i)=0;
  %end
  if i>=3
      if Y(i-1)==0
         % i-1
          %X(i)
          %Y(i)
          %Z(i)
      else
          %c2=Y(i)/Y(i-1);
          %c5=abs(c2-Y(i-1)/Y(i-2));
          %i-1
          %X(i)
          %Y(i)
          %Z(i)
      end
  else
     % i-1
     % X(i)
      %Y(i)
      %Z(i)
  end
  i=i+1;
end
%'c='
%c2
s1=0;
s2=0;
s3=0;
FG=zeros(1,3*i-3);
for j=1:i-1
    FG(j)=X(j);
    s1=s1+FG(j);
    FG(j+i-1)=Y(j);
    s2=s2+FG(j+i-1);
    FG(j+2*i-2)=Z(j);
    s3=s3+FG(j+2*i-2);
end
%si=size(FG)
%FG
%s1
%s2
%s3

end

