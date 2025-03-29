clear all; close all;
ck_1=0; rk_1=0;

for d=1;
    k=d-1;
    if k>=0; rk=0.4;
    else rk=0;
    end

    ek = rk - 0.04 * (0.7*ck_1 + 1.037*rk_1);
    ck = 0.7*ck_1 + 1.037*rk_1;

    ck_1 = ck;
    rk_1 = rk;

    plot(k,ek,'k*'); hold on;
    plot(k, ck, 'b*')
    
end

disp(ek)
disp(ck)