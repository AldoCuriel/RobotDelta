%% 
clc
clear
close all

x = .3;
y = .5;
z = -1.1;

Sb = .567;
Sp = .076;
L = .524;
l = 1.244;
h =.131;

Wb =((sqrt(3)/6)*Sb);
Ub =((sqrt(3)/3)*Sb);
Wp =((sqrt(3)/6)*Sp);
Up =((sqrt(3)/3)*Sp);

a = Wb - Up;
b = Sp/2 - (sqrt(3)/2)*Wb;
c = Wp - (1/2)*Wb;
%%

E1 = 2*L*(y+a);
F1 = 2*z*L;
G1 = (x^2)+(y^2)+(z^2)+(a^2)+(L^2)+(2*y*a)-(l^2);

E2 = -L*(sqrt(3)*(x+b)+y+c);
F2 = 2*z*L;
G2 = (x^2)+(y^2)+(z^2)+(b^2)+(c^2)+(L^2)+(2*((x*b)+(y*c)))-(l^2);

E3 = L*(sqrt(3)*(x-b)-y-c);
F3 = 2*z*L;
G3 = (x^2)+(y^2)+(z^2)+(b^2)+(c^2)+(L^2)+(2*((-x*b)+(y*c)))-(l^2);

%%
t1 = (-F1+sqrt((E1^2)+(F1^2)-(G1^2)))/(G1-E1);
t2 = (-F2+sqrt((E2^2)+(F2^2)-(G2^2)))/(G2-E2);
t3 = (-F3+sqrt((E3^2)+(F3^2)-(G3^2)))/(G3-E3);

th1p = 2*atan(t1);
th2p = 2*atan(t2);
th3p = 2*atan(t3);

th1p=rad2deg(th1p)
th2p=rad2deg(th2p)
th3p=rad2deg(th3p)

t1 = (-F1-sqrt((E1^2)+(F1^2)-(G1^2)))/(G1-E1);
t2 = (-F2-sqrt((E2^2)+(F2^2)-(G2^2)))/(G2-E2);
t3 = (-F3-sqrt((E3^2)+(F3^2)-(G3^2)))/(G3-E3);

th1n = 2*atan(t1);
th2n = 2*atan(t2);
th3n = 2*atan(t3);

th1n=rad2deg(th1n)
th2n=rad2deg(th2n)
th3n=rad2deg(th3n)

%%
B1 = [0 ; -Wb ; 0];
B2 = [(sqrt(3)/2)*Wb ; (1/2)*Wb ; 0];
B3 = [-(sqrt(3)*2)*Wb ; (1/2)*Wb ; 0];

b1 = [Sb/2;-Wb;0];
b2 = [0;Ub;0];
b3 = [-Sb/2; -Wb; 0];

P1 = [0;-Up;0];
P2 = [Sp/2;Wp;0];
P3 = [-Sp/2;Wp;0];

bx = [b1(1) b2(2) b3(3) b1(1)];
by = [b1(2) b2(2) b3(3) b1(2)];
bz = [b1(3) b2(3) b3(3) b1(3)];

Px = [P1(1) P2(2) P3(3) P1(1)];
Py = [P1(2) P2(2) P3(3) P1(2)];
Pz = [P1(3) P2(3) P3(3) P1(3)];


% figure;
% hold on;
% plot(bx,by);
% plot(Px,Py);


