clear; close all;

T = 6*60;

Hz = tf(0.152, [1 -0.05], T);
Gz = tf(1, 1, T);

ftma = series(Hz, Gz);
ftmf = feedback(ftma, 1)

t = 0: T:10000;
[y_t, t] = step(ftmf*0.4, t);
valor_final = y_t(end);
disp(valor_final)

step(ftmf * 0.4)
xlim([0 4000])