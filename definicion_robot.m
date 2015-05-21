function [a b c L l EspacioTrabajo Sp Sb] = definicion_robot

% ordenadas en mm
% Sb = 567;
% Sp = 76;
% L = 524;
% l = 1244;
% h = 131;
% Espacio de Trabajo
pointA = [.1,.1,0];
pointB = [-.1,.1,0];
pointC = [-.1,-.1,0];
pointD = [.1,-.1,0];

EspacioTrabajo = [pointA;pointB;pointC;pointD];
% ordenadas en m
% Sb = .215;
% Sp = .1;
% L = .16;
% l = .46;
% h =.5;
% ROBOT DEFINIDO POR ARTICULO
Sb = .567;
Sp = .076;
L = .524;
l = 1.244;
h =.131;

Wb = (sqrt(3)/6)*Sb;
Ub = (sqrt(3)/3)*Sb;
wp = (sqrt(3)/6)*Sp;
up = (sqrt(3)/3)*Sp;

a = Wb - up;
b = Sp/2 - (sqrt(3)/2)*Wb;
c = wp - (1/2)*Wb;

flag1 = 1;
end