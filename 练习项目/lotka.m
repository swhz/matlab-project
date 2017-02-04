function yp = lotka(t,y)
% predator-prey model.
yp=diag([1 - .01*y(2), -1+.02*y(1)])*y;
end

