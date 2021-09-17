function Dv = get_speed_error_1_2()
    syms Dm DM Dk Da
    v0 = get_speed_formul_1_2();
    Dv = diff(v0,'m')*Dm + diff(v0,'M')*DM + diff(v0,'k')*Dk+diff(v0,'a')*Da;
end