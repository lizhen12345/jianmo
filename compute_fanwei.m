function [alt1,alt2] = compute_fanwei(ceMianji,chang,gao);
alt1 = atan(gao^2/ceMianji);
alt2 = atan(ceMianji/(chang^2));
end