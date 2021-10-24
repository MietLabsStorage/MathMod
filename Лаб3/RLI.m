v_en = 1000;
dv_en = 10;
alef_en = pi/4;
dalef_en = pi/90;
location = 75000;
minDiap = 55000;
maxDiap = 35000;
eps = 10;

[X1 H1] = RealEnemyPath(v_en+dv_en, alef_en+dalef_en);
[X2 H2] = RealEnemyPath(v_en-dv_en, alef_en+dalef_en);
[X3 H3] = RealEnemyPath(v_en+dv_en, alef_en-dalef_en);
[X4 H4] = RealEnemyPath(v_en-dv_en, alef_en-dalef_en);

index = 1;
newIndex = 1;
while(true)   
    if(location - X1(index) <= minDiap)
        x1(newIndex) = X1(index);
        h1(newIndex) = normrnd(H1(index), eps);
        
        x2(newIndex) = X2(index);
        h2(newIndex) = normrnd(H2(index), eps);
        
        x3(newIndex) = X3(index);
        h3(newIndex) = normrnd(H3(index), eps);
        
        x4(newIndex) = X4(index);
        h4(newIndex) = normrnd(H4(index), eps);
        
        if(abs(h3(newIndex) - h4(newIndex)) <= eps)
            h3(newIndex) = (h3(newIndex)+h4(newIndex))/2;
            h3(newIndex) = (h3(newIndex)+h4(newIndex))/2;
        end 
        
        newIndex = newIndex + 1;
    end
    
    if(location - X1(index) <= maxDiap)
        break
    end
    
    index = index+1;
end

hold on
grid on

plot(X1, H1)
plot(X2, H2)
plot(X3, H3)
plot(X4, H4)
xlim([0 120000])
ylim([0 30000])
plot(75000, 0, 'g+')
plot(100000, 0, 'gp')
legend('++', '-+', '+-', '--', 'ПРО', 'штаб');
xlabel('расстоие от базы противника, м')
ylabel('высота, м')
title('полет вражеских ракет')

plot(x1, h1,'*')
plot(x2, h2,'*')
plot(x3, h3,'*')
plot(x4, h4,'*')