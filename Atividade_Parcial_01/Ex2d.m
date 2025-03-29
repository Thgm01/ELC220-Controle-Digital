clear; close all; T=0.6;

H = tf(1.037,[1 -0.741], T);
Gc = tf(1, 1, T)

gma = series(H, Gc);
gmf = feedback(gma, 0.04)

t = 0: T:100;
[y_t, t] = step(gmf*0.4, t);
step(gmf*0.4)
ylim([0 1.6])
valor_final = y_t(end);
disp(valor_final)

% r=ones(1,21); k=0:20;
% [n,d]=tfdata(gmf); n=cell2mat(n);d=cell2mat(d);
% y=filter(n,d,r);e=0.4-y;
% plot(k,e,'k');grid; title('Erro');xlabel('k');ylabel('e(k)')
