clear; close all
Gso = tf(20, [1 20]);
K = 2.4;
Gs = tf(200, [0.5 1 0]);
red = 1/100;
sensor = 0.07;

ftma = series(Gso*K, Gs*red);
ftmf = feedback(ftma, sensor)

T = 0.1;
G_z = c2d(ftmf, T, 'tustin');

zpk(G_z)