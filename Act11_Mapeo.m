clear all
close all
clc

syms x(t) y(t) th(t) t % Grados de Libertad del robot móvil

xi_inercial = [x; y; th];
xip_inercial = diff(xi_inercial, t); 

LetraX = [-5, -3, 5, 0, -6, 10, 9, 5, -1, 6, 5, 7, 11, 20, 10, -9, 1, 3, 15, -10 ];
LetraY = [9,8,-2,0,3,-2,1,2,-1,4,7,7,-4,5,9,-8,1,1,2,0];
LetraTheta = [-2,63,90,180,-55,45,88,33,21,-40,72,30,360,270,345,8,60,-30,199,300];

% Número de puntos en los arreglos
num_puntos = length(LetraX);
letra = ['A':'M', 'Ñ', 'N':'T'];

for i = 1:num_puntos
    x_i = LetraX(i);    % Posición inicial en el eje x
    y_i = LetraY(i);    % Posición inicial en el eje y
    th_i = (LetraTheta(i));   % Orientación inicial del robot en radianes
    
    Pos_i = [x_i; y_i; th_i];
    Rot_i = [cos(th_i)  -sin(th_i)  0;
             sin(th_i)   cos(th_i)  0;
             0         0        1];
    
    xi_local_i = Rot_i * Pos_i;

    fprintf('********* Para el punto %s ************\n', letra(i));
    fprintf('Mi Vector de posición local: \n');
    disp(xi_local_i);
    fprintf('La Magnitud del vector resultante es: %.2f\n',sqrt(xi_local_i(1)^2 + xi_local_i(2)^2));
end