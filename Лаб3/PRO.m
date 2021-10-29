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
t_rli = 0.1;
v_pro=2000;
b_step = 0.001;

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
        if t_last - t < t_rli
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
                coords1 = solve(double(coefs.a)*x*x+double(coefs.b)*x+double(coefs.c));
                coord1 = double(coords1(1));
                
                betta1=(asin( g*(location-coord1) / v_pro / v_pro )) / 2;
                
                syms betta2;
                coord2 = X_pusk + ( location - X_pusk ) * (v_en * cos(alef_en)) / (v_pro * cos(betta2));
                t_fly = coord2 /v_pro / cos(betta2);
                h_en_coord2 = double(coefs.a)*coord2*coord2+double(coefs.b)*coord2+double(coefs.c);
                
                q = v_pro*sin(betta2)*t_fly-t_fly*t_fly*g/2-h_en_coord2;
                qb = 350;
                bb = 1;
                for b = 0:b_step:pi/2
                    qq=double(subs(q, 'betta2', b));
                    if abs(qq) < qb
                       qb = abs(qq);
                       betta2 = b;
                    end
                end
                coord2 = subs(coord2, 'betta2', betta2);
                h2 = double(coefs.a)*coord2*coord2+double(coefs.b)*coord2+double(coefs.c);
                syms b2;
                %sss = v_pro*tan(b2)-g*x*x/v_pro/v_pro/cos(b2)/cos(b2) - h2
                %f=2*v_pro*v_pro*sqrt(1-cos(b2)*cos(b2)) - g*coord2*coord2-2*h2*v_pro*cos(b2)*cos(b2);
                %betta2 = double(solve(f))
                betta2=double(atan(h2/(location-coord2)))
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
    
    x=double(coords1(1)):0.1:100000;
    plot(x, double(coefs.a).*x.*x+double(coefs.b).*x+double(coefs.c), 'r');
    
    x=double(coords1(1)):0.1:location;
    plot(x, x*tan(betta1)-g.*x.*x./2./v_pro./v_pro./cos(betta1)./cos(betta1));
    
    x=double(coord2):0.1:location;
    h=(1-(x-double(coord2))./(location-double(coord2))).*double(h2);
    plot(x, h);
    
    legend('траектория врага', 'ПРО', 'штаб', 'снятые данные', 'рак. в мом. пуск. наш.', 'мним.траект', 'возмездие', 'возмездие');
end