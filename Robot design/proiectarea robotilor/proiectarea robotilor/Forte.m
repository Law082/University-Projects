%torques = out.t; 
%forces = out.f;
torques = reshape(out.t.Data, 3, []);
forces = reshape(out.f.Data, 3, []);

Fx = forces(1,:);
maxFx = max(Fx);
 figure
 plot(out.f.Time,Fx)
 xlabel("Timp(s)")
 ylabel("Fx(N)")
 title("Grafic Fx")
 

Fy = forces(2,:);
maxFy = max(Fy);
 figure
 plot(out.f.Time,Fy)
 xlabel("Timp(s)")
 ylabel("Fy(N)")
 title("Grafic Fy")


Fz = forces(3,:);
maxFz = max(Fz);
 figure
 plot(out.f.Time,Fz)
 axis([0 20 600 650])
 xlabel("Timp(s)")
 ylabel("Fz(N)")
 title("Grafic Fz")


Mx = torques(1,:);
maxMx = max(Mx);
 figure
 plot(out.t.Time,Mx)
 xlabel("Timp(s)")
 ylabel("Mx(N*m)")
 title("Grafic Mx")

My = torques(2,:);
maxMy = max(My);
 figure
 plot(out.t.Time,My)
 xlabel("Timp(s)")
 ylabel("My(N*m)")
 title("Grafic My")
 

Mz = torques(3,:);
maxMz = max(Mz);
 figure
 plot(out.t.Time,Mz)
 xlabel("Timp(s)")
 ylabel("Mz(N*m)")
 title("Grafic Mz")
