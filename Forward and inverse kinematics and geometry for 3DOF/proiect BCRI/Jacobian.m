function [J] = Jacobian(q1,q2,q3,T10,T21,T32,Te3)

% translatie pe x

Dx = [0;0;0]

% translatie pe y

Dy = [0;0;0]

% Rotatie pe Z
T03=T10*T21*T32;
Rz =T03([1:3],[3]);

% derivate pozitie efector

T0e = T03*Te3;
pe = T0e([1:3],[4]);
peq1 = diff(pe,q1);
peq2 = diff(pe,q2);
peq3 = diff(pe,q3);

% matricea Jacobian

J = [peq1, peq2, peq3;...
     Dx, Dy, Rz];

disp('T03=')
disp(T03)
disp('Rz=')
disp(Rz)
disp('T0e=')
disp(T0e)
disp('pe=')
disp(pe)
disp('peq1=')
disp(peq1)
disp('peq2=')
disp(peq2)
disp('peq3=')
disp(peq3)
end