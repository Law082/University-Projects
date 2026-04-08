function [viteza_liniara,omega]=Cinematica_Directapuma(Q,viteza)

q1=90;
q2=30;
q3=15;

viteza_liniara=[];
omega=[];
for i=1:length(viteza)
    J=  [(pi*sin((pi*q1)/180)*sin((pi*q2)/180)*sin((pi*q3)/180))/900 - (pi*cos((pi*q2)/180)*cos((pi*q3)/180)*sin((pi*q1)/180))/900 - (pi*cos((pi*q2)/180)*sin((pi*q1)/180))/600, - (pi*cos((pi*q1)/180)*sin((pi*q2)/180))/600 - (pi*cos((pi*q1)/180)*cos((pi*q2)/180)*sin((pi*q3)/180))/900 - (pi*cos((pi*q1)/180)*cos((pi*q3)/180)*sin((pi*q2)/180))/900, - (pi*cos((pi*q1)/180)*cos((pi*q2)/180)*sin((pi*q3)/180))/900 - (pi*cos((pi*q1)/180)*cos((pi*q3)/180)*sin((pi*q2)/180))/900;
         (pi*cos((pi*q1)/180)*cos((pi*q2)/180))/600 + (pi*cos((pi*q1)/180)*cos((pi*q2)/180)*cos((pi*q3)/180))/900 - (pi*cos((pi*q1)/180)*sin((pi*q2)/180)*sin((pi*q3)/180))/900, - (pi*sin((pi*q1)/180)*sin((pi*q2)/180))/600 - (pi*cos((pi*q2)/180)*sin((pi*q1)/180)*sin((pi*q3)/180))/900 - (pi*cos((pi*q3)/180)*sin((pi*q1)/180)*sin((pi*q2)/180))/900, - (pi*cos((pi*q2)/180)*sin((pi*q1)/180)*sin((pi*q3)/180))/900 - (pi*cos((pi*q3)/180)*sin((pi*q1)/180)*sin((pi*q2)/180))/900;
                                                                                                                                                                              0,                                                      (pi*sin((pi*q2)/180)*sin((pi*q3)/180))/900 - (pi*cos((pi*q2)/180)*cos((pi*q3)/180))/900 - (pi*cos((pi*q2)/180))/600,                                     (pi*sin((pi*q2)/180)*sin((pi*q3)/180))/900 - (pi*cos((pi*q2)/180)*cos((pi*q3)/180))/900;
                                                                                                                                                                             0,                                                                                                                                                        -sin((pi*q1)/180),                                                                                                           -sin((pi*q1)/180);];

   J_w=[0,0,0;
        0,0,0;
        1,1,1;];
%JP=transpose(J)*inv(J*transpose(J));
viteza_liniara=[viteza_liniara,J*viteza(:,i)];
omega=[omega,J_w*viteza(:,i)];

end

end