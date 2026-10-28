function H = EXPCF(xi)

X = SKEW6(xi);

w = xi(1:3);
v = X(1:3,4);
W = X(1:3,1:3);

theta = norm(w);
R = EXPCR(w);

if theta < 1e-4
    % Taylor expansions for small rotation angles.
    B = 1/2 - theta^2/24 + theta^4/720;
    C = 1/6 - theta^2/120 + theta^4/5040;
else
    B = 2*(sin(theta/2)/theta)^2;
    C = (theta-sin(theta))/theta^3;
end

J = eye(3) + B*W + C*(W*W);
p = J*v;

H = [R, p;
    0, 0, 0, 1];
end