function X = SKEW6(xi)
% Input: xi = [w; v], a 6x1 vector.
% Return its 4x4 twist matrix representation.

w = xi(1:3);
v = xi(4:6);

X = [SKEW3(w), v;
    zeros(1,4)];
end