function Da = get_angle_error_1_2()
    syms Dm DM Dk
    a = get_angle_formul_1_2();
    Da = diff(a,'m')*Dm + diff(a,'M')*DM + diff(a,'k')*Dk;
end
