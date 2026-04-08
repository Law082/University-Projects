%torques = out.t; 
%forces = out.f;
torques = reshape(out.tt.Data, 3, []);
forces = reshape(out.ft.Data, 3, []);

Fx = forces(1,:);
maxFx = max(Fx);
 figure
 plot(out.ft.Time,Fx)
 xlabel("Timp(s)")
 ylabel("Fx(N)")
 title("Grafic Fx")
 

Fy = forces(2,:);
maxFy = max(Fy);
 figure
 plot(out.ft.Time,Fy)
 axis([0 10 -700 -600])
 xlabel("Timp(s)")
 ylabel("Fy(N)")
 title("Grafic Fy")


Fz = forces(3,:);
maxFz = max(Fz);
 figure
 plot(out.ft.Time,Fz)
 %axis([0 20 600 650])
 xlabel("Timp(s)")
 ylabel("Fz(N)")
 title("Grafic Fz")


Mx = torques(1,:);
maxMx = max(Mx);
 figure
 plot(out.tt.Time,Mx)
 xlabel("Timp(s)")
 ylabel("Mx(N*m)")
 title("Grafic Mx")

My = torques(2,:);
maxMy = max(My);
 figure
 plot(out.tt.Time,My)
 xlabel("Timp(s)")
 ylabel("My(N*m)")
 title("Grafic My")
 

Mz = torques(3,:);
maxMz = max(Mz);
 figure
 plot(out.tt.Time,Mz)
 xlabel("Timp(s)")
 ylabel("Mz(N*m)")
 title("Grafic Mz")
