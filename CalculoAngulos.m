function [th1n th2n th3n] = CalculoAngulos(x,y,z)

[a b c L l EspacioTrabajo Sp Sb] = definicion_robot;

E1 = 2*L*(y+a);
F1 = 2*z*L;
G1 = (x^2)+(y^2)+(z^2)+(a^2)+(L^2)+(2*y*a)-(l^2);

E2 = -L*(sqrt(3)*(x+b)+y+c);
F2 = 2*z*L;
G2 = (x^2)+(y^2)+(z^2)+(b^2)+(c^2)+(L^2)+(2*((x*b)+(y*c)))-(l^2);

E3 = L*(sqrt(3)*(x-b)-y-c);
F3 = 2*z*L;
G3 = (x^2)+(y^2)+(z^2)+(b^2)+(c^2)+(L^2)+(2*((-x*b)+(y*c)))-(l^2);


t1 = (-F1+sqrt((E1^2)+(F1^2)-(G1^2)))/(G1-E1);
t2 = (-F2+sqrt((E2^2)+(F2^2)-(G2^2)))/(G2-E2);
t3 = (-F3+sqrt((E3^2)+(F3^2)-(G3^2)))/(G3-E3);

th1p = 2*atand(t1);
th2p = 2*atand(t2);
th3p = 2*atand(t3);


t1 = (-F1-sqrt((E1^2)+(F1^2)-(G1^2)))/(G1-E1);
t2 = (-F2-sqrt((E2^2)+(F2^2)-(G2^2)))/(G2-E2);
t3 = (-F3-sqrt((E3^2)+(F3^2)-(G3^2)))/(G3-E3);

th1n = 2*atand(t1);
th2n = 2*atand(t2);
th3n = 2*atand(t3);
end
