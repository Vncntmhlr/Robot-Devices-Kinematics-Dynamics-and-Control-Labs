%% For R = Rx(phi)*Ry(theta)*Rz(psi), singularities occur when
% cos(theta) = 0, i.e., theta = pi/2 + k*pi.
% At these configurations, psi and phi cannot be determined
% independently (gimbal lock). Near them, angle recovery is
% numerically sensitive. The function issues a warning and
% chooses psi = 0 to return an equivalent representation.

function angles = EULERXYZINV(R)

tol = 1e-10;

cTheta = hypot(R(1,1), R(1,2));
theta = atan2(R(1,3), cTheta);

if cTheta > tol
    psi = atan2(-R(1,2), R(1,1));
    phi = atan2(-R(2,3), R(3,3));
else
    warning('EULERXYZINV:GimbalLock', ...
        'Near Euler-angle singularity; choosing psi = 0.');

    psi = 0;
    phi = atan2(R(3,2), R(2,2));
end

angles = [psi; theta; phi];
end
