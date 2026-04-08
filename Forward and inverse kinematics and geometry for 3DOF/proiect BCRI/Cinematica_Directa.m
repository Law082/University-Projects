function [viteza_liniara,omega]=Cinematica_Directa(Q,viteza)

%dimensiuni brate

l4 = 0.1;

viteza_liniara=[];
omega=[];
for i=1:length(viteza)
   J=[   1, 0, l4*(-sin(Q(3,i)/5));
         0, 1, l4*(cos(Q(3,i)/5));
         0, 0, l4*(-sin(Q(3,i)));
         ];

   J_w=[0,0,0;
        0,0,0;
        0,0,1;];
JP=transpose(J)*inv(J*transpose(J));
viteza_liniara=[viteza_liniara,JP*viteza(:,i)];
omega=[omega,J_w*viteza(:,i)];

end

end