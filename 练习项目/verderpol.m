function [ xprime ] = verderpol(t,x)
global mu;
xprime=[x(2);mu*(1-x(1)^2)*x(2)-x(1)];

end

