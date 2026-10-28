function Hinv = FINV(H)

R = H(1:3,1:3);
p = H(1:3,4);

Hinv = [R', -R'*p;
    0, 0, 0, 1];
end