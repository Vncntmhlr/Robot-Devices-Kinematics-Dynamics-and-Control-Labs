function R = EULERXYZ(angles)

psi   = angles(1);
theta = angles(2);
phi   = angles(3);

R = ROTX(phi) * ROTY(theta) * ROTZ(psi);
end