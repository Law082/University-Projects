
function [J] = Jacobianpuma(q1,q2,q3,T10,T21,T32,Te3)

% Rotatie pe z

Rz = T10([1:3],[3]);

% Rotatie pe y
T02 = T10*T21;
Ry1 = T02([1:3],[2]);

% Rotatie pe y
T03= T02*T32;
Ry2 = T03([1:3],[2]);

% derivate pozitie efector

T0e = T02*T32*Te3;
pe = T0e([1:3],[4]);
peq1 = diff(pe,q1);
peq2 = diff(pe,q2);
peq3 = diff(pe,q3);

% matricea Jacobian

J = [peq1, peq2, peq3;...
        Rz,Ry1,Ry2]

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
disp("J=")
disp(J)
disp(Ry1)
disp(Ry2)
end