function [h, l]=get_position_formuls() 
    [vx, vy]=get_speeds_formuls();
    vx=vx(1);
    syms k m g v0 a t h0 alef
    ax=-k*vx*vx/m;
    ay=(m*g-k*vy)/m;
    h=h0-sign(alef)*v0*sin(alef)*t-ay*t*t/2;
    l=v0*cos(alef)*t-ax*t*t/2;
end