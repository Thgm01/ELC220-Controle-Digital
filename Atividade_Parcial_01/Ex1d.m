% 1.d)

clear, clc

% Definindo as FTs Usadas no sistema
G   = tf(2, [1 0.5]);
Gd  = tf(2.5, [1 0.5]);

% Definindo as entradas e condicoes iniciais
U = tf(5, [1 0]);
Ud = tf(1, [1 0], 'InputDelay', 2);
X0 = 25;

% Definindo as resopostas das FTs
t = 0: 0.01:15;
[y_t_G, t] = impulse(G*U, t);
y_t_G = y_t_G + X0;

[y_t_Gd, t] = impulse(-Gd*Ud, t);

y_t = y_t_G + y_t_Gd;

% Calcular o valor final (regime permanente)
valor_final = y_t(end);


figure;
hold on;

    plot(t, y_t_G, 'b', 'LineWidth', 1.2, 'DisplayName', 'Planta');
    plot(t, y_t_Gd, 'r', 'LineWidth', 1.2, 'DisplayName', 'Disturbio');
    plot(t, y_t, 'g', 'LineWidth', 2, 'DisplayName', 'Saida');
    y_line = yline(valor_final, '--','LineWidth', 1, 'Color', [0.7 0.7 0.7]);
    set(y_line, 'HandleVisibility', 'off');  

    legend('Location', 'best');

    grid on;
    xlabel('Tempo [min]');
    ylabel('Temperatura [°C]');
    title('Resposta ao degrau com condição inicial e disturbio');
    xlim([0 10]);
    ylim([-10 60]); 

hold off;
