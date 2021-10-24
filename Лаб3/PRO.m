clear

doPlot = true;

v_en = 1000;
alef_en = pi/4;
location = 75000;
minDiap = 10000;
eps = 200;
t_solve = 5;

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

while(true)
    t=t+0.01;
    index=index+1;
    X_en(index) = v_en*cos(alef_en)*t;
    H_en(index) = v_en*sin(alef_en)*t-9.8*t*t/2;

    if H_en(index) >= minDiap && X_en(index) < location/2
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

    plot(X_en, H_en)
    plot(75000, 0, 'g+')
    plot(100000, 0, 'gp')
    plot(x_en, h_en,'*')
    plot(X_pusk, H_pusk, '^')
    
    legend('траектория врага', 'ПРО', 'штаб', 'снятые данные', 'вр. рак. в мом. пуск. наш.');
end