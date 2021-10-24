v_en = 1000;
dv_en = 10;
alef_en = pi/4;
dalef_en = pi/90;

[X1 H1] = RealEnemyPath(v_en+dv_en, alef_en+dalef_en);
[X2 H2] = RealEnemyPath(v_en-dv_en, alef_en+dalef_en);
[X3 H3] = RealEnemyPath(v_en+dv_en, alef_en-dalef_en);
[X4 H4] = RealEnemyPath(v_en-dv_en, alef_en-dalef_en);

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