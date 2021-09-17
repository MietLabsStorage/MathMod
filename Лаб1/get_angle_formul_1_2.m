function a = get_angle_formul_1_2()
    syms g l m v0 M k
    a = acos((g*l-((m*v0 / (m+M))^2) / 2 * (1-k)) / (g *l));
end