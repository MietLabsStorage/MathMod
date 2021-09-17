function v0 = get_speed_formul_1_2()
    syms g l m a M k
    v0 = (m+M) / m * (2*g*l*(1-cos(a))/(1-k))^0.5;
end