function R = EXPCR(x)

theta = norm(x);

if theta == 0
    R = eye(3);
    return;
end

n = x/theta;
N = SKEW3(n);

R = eye(3) + sin(theta)*N + (1-cos(theta))*(N*N);
end