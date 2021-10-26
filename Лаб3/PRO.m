clear

doPlot = true;

v_en = 1000;
alef_en = pi/4;
location = 75000;
minDiap = 10000;
maxDiap = 20000;
eps = 10;
t_solve = 5;
g = 9.8;
t_iter = 0.01;

t=0;
index = 1;
newIndex = 1;
X_en(index) = 0;
H_en(index) = 0;
x_en(newIndex) = 0;
h_en(newIndex) = 0;

t_last = 0;
t_pusk = 0;
X_pusk =0;
H_pusk =0;

syms a
syms b
syms c

while(true)
    t=t+t_iter;
    index=index+1;
    X_en(index) = v_en*cos(alef_en)*t;
    H_en(index) = v_en*sin(alef_en)*t-g*t*t/2;

    if H_en(index) >= minDiap && H_en(index) <= maxDiap && X_en(index) < location/2
        if t_last == 0
            t_last = t; 
        end
        if t_last - t < 0.1
            x_en(newIndex) = X_en(index);
            h_en(newIndex) = normrnd(H_en(index), eps);
            newIndex = newIndex+1;
            t_last=t_last+1;
        end 
    else
        if t_last ~= 0 
            if t-t_last >= t_solve-1
                t_pusk = t; 
                X_pusk = X_en(index);
                H_pusk = H_en(index);
                t_last = 0;
                
                Q = 0;
                for s = 1:1:newIndex-1
                    Q = Q + (h_en(s) - a*x_en(s)*x_en(s)-b*x_en(s)-c)^2;                    
                end                
                coefs = solve(diff(Q, a),diff(Q, b),diff(Q, c));
                syms x
                coords = solve(double(coefs.a)*x*x+double(coefs.b)*x+double(coefs.c));
            end
        end
    end
    
    
    if H_en(end)<=0 && X_en(end)>0
        break
    end
end

if(doPlot)
    hold on
    grid on

    xlim([-1000 120000])
    ylim([0 30000])
    xlabel('расстоие от базы противника, м')
    ylabel('высота, м')
    title('полет вражеских ракет')

    plot(X_en, H_en, 'b')
    plot(location, 0, 'k+', 'LineWidth', 2)
    plot(100000, 0, 'kp', 'LineWidth', 2)
    plot(x_en, h_en,'*')
    plot(X_pusk, H_pusk, '^', 'LineWidth', 2)
    
    x=double(coords(1)):0.1:100000;
    plot(x, double(coefs.a).*x.*x+double(coefs.b).*x+double(coefs.c), 'r');
    
    legend('траектория врага', 'ПРО', 'штаб', 'снятые данные', 'рак. в мом. пуск. наш.', 'мним.траект');
end