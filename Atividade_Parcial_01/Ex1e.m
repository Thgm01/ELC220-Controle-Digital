% 1.e)

clear, clc

% Definindo as FTs Usadas no sistema
G   = tf(2, [1 0.5]);
Gd  = tf(2.5, [1 0.5]);

% Definindo as entradas e condicoes iniciais
U = tf(5, [1 0]);
Ud_initial = tf(1, [1 0], 'InputDelay', 2);
Ud_final = tf(1, [1 0], 'InputDelay', 14);

X0 = 25;

% Definindo as resopostas das FTs
t = 0: 0.01:30;
[y_t_G, t] = impulse(G*U, t);
y_t_G = y_t_G + X0;

[y_t_Gd_initial, t] = impulse(-Gd*Ud_initial, t);
[y_t_Gd_final, t] = impulse(-Gd*Ud_final, t);
y_t_Gd = y_t_Gd_initial - y_t_Gd_final;

y_t = y_t_G + y_t_Gd;

% Calcular o valor final (regime permanente)
valor_final = y_t(end);


figure;
hold on;

    plot(t, y_t_G, 'b', 'LineWidth', 1.2, 'DisplayName', 'Planta');
    plot(t, y_t_Gd, 'r', 'LineWidth', 1.2, 'DisplayName', 'Distúrbio');
    plot(t, y_t, 'g', 'LineWidth', 2, 'DisplayName', 'Saída');
    y_line = yline(valor_final, '--','LineWidth', 1, 'Color', [0.7 0.7 0.7]);
    set(y_line, 'HandleVisibility', 'off');  

    legend('Location', 'best');

    grid on;
    xlabel('Tempo [min]');
    ylabel('Temperatura [°C]');
    title('Resposta ao degrau com condição inicial e distúrbio finito');
    xlim([0 22]);
    ylim([-10 60]); 

hold off;
