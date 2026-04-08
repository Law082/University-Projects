function modeldinamic()
clear all
clc
%Calculul matricei M(matricea de inertie)
syms t1 t2 t3 q1 q2 q3 l1 l2 l3 m1 m2 m3 g h dq1 dq2 dq3 ddq1 ddq2 ddq3



pc1 = [t1*cos(q1);
       t1*sin(q1);
          h    ]

pc2 = [l1*cos(q1)+t2*cos(q2);
       l1*sin(q1);
       h+t2*sin(q2)         ]

pc3= [l1*cos(q1)+l2*cos(q2)+t3*cos(q3+q2)
      l1*sin(q1)
      h+l2*sin(q2)+t3*sin(q3+q2)           ]

p1q1=diff(pc1,q1)
p2q1=diff(pc2,q1)
p2q2=diff(pc2,q2)
p3q1=diff(pc3,q1)
p3q2=diff(pc3,q2)
p3q3=diff(pc3,q3)

Jv1=[p1q1]
zero_cols=zeros(size(Jv1,1),2)
Jv1_zero=[Jv1,zero_cols]

Jv2=[p2q1 p2q2]
zero_cols2=zeros(size(Jv2,1),1)
Jv2_zero=[Jv2,zero_cols2]
Jv3=[p3q1 p3q2 p3q3]

Jw1=[0 0 0;
     0 0 0;
     1 0 0]
Jw2=[0 -sin(q1) 0;
     0 cos(q1) 0;
     1 0 0]
Jw3=[0 -sin(q1) -sin(q1);
     0 cos(q1)  cos(q1);
     1   0         0    ]

Ic1=[1 0 0;
     0 1 0;
     0 0 1]


M=(m1*(transpose(Jv1_zero))*Jv1_zero)+(m2*(transpose(Jv2_zero))*Jv2_zero)+(m3*(transpose(Jv3))*Jv3)+((transpose(Jw1))*Ic1*Jw1)+((transpose(Jw2))*Ic1*Jw2)+((transpose(Jw3))*Ic1*Jw3)
%q1d=diff(q1);
%q2d=diff(q2);
%q3d=diff(q3);
%
%q1dd=diff(q1d);
%q2dd=diff(q2d);
%q3dd=diff(q3d);
%
%Q1=[q1dd;
%    q2dd;
%    q3dd;]
%
%Mq=M*Q1

%M=[m11 m12 m13;
%   m21 m22 m23;
%   m31 m32 m33;]

%Calculul matricei C(centrifuge)

%C=[b111 b122 b133;
%   b211 b222 b233;
%   b311 b322 b333;]

%dfq1=diff(q1)
%dfq2=diff(q2)
%dfq3=diff(q3)

%Q=[diff(q1)^2;
%  diff(q2)^2;
%  diff(q3)^2;]

q=[q1 q2 q3]
%Calculeaza fiecare b
for i=1:3
    for j=1:3
        mijk=diff(M(i,j),q(j));
        mikj=mijk;
        mjki=diff(M(j,j),q(i));
        C(i,j)=1/2 *(mijk+mikj-mjki)
    end
end

%C=c*Q

 %Calcularea matricei B (Coriolis)

for i=1:3
    for j=1:3
        mijk=diff(M(i,j),q3);
        mikj=diff(M(i,j),q2);
        mjki=diff(M(j,j),q1);
        b(i,j)=1/2 *(mijk+mikj-mjki);
    end
end
 
B=2*b
% Q2=[diff(q1)*diff(q2)
%     diff(q1)*diff(q3)
%     diff(q2)*diff(q3)]

 
%B=b*Q2

 %Determinarea termenului G 

%G=-[transpose(Jv1_zero) transpose(Jv2_zero) transpose(Jv3);]*[(m1*g);(m2*g);(m3*g)]
G=((-transpose(Jv1_zero))*m1*g)-((transpose(Jv2_zero))*m2*g)-((transpose(Jv3))*m3*g)

%Modelul dinamic M+C+B+G=tau1,2,3

Tau=M*[ddq1;ddq2;ddq3]+C*[dq1*dq1;dq2*dq2;dq3*dq3]+B*[dq1*dq2;dq1*dq3;dq2*dq3]
end


