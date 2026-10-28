%% Task 2 - 1(a): Rotations about the X axis

angles = [0,pi/8,pi/4,pi];

figure;

for k = 1:4
    subplot(2,2,k); %divide into 4 plots

    R = ROTX(angles(k));
    plotr(R);

    view(3);
    
    title(sprintf('Rx: %.1f degrees', rad2deg(angles(k))));


end

exportgraphics(gcf, '../written/task2_1a.pdf', ...
    'ContentType', 'image', 'Resolution', 300); %export graphic to written folder


%% Task 2 - 1(b): Transform points

P = [1,0,0,1;
    0,1,0,1;
    0,0,1,1];
R = ROTX(pi/4);
t = [0.5;-0.5;0.5];

figure;
hold on;

for k = 1:4
    p = P(:,k);
    pNew = R*p + t;

    plotp3(p, 'b');
    plotp3(pNew, 'r');

    text(p(1), p(2), p(3), sprintf(' P%d', k));
    text(pNew(1), pNew(2), pNew(3), sprintf(' Q%d', k));
end

axis equal;
grid on;
view(3);

xlabel('X');
ylabel('Y');
zlabel('Z');

title('Points: Rx(45 deg), then translation');
legend('Original', 'Transformed', 'Location', 'best');

hold off;

exportgraphics(gcf, '../written/task2_1b.pdf', ...
    'ContentType', 'image', 'Resolution', 300);


%% Task 2 - 1(c): Points in homogeneous coordinates

H = [R, t;
    0, 0, 0, 1];
P4 = [P;
    ones(1, 4)];

figure;
hold on;

for k = 1:4
    p = P4(:, k);
    pNew = H*p;

    plotp4(p, 'b');
    plotp4(pNew, 'r');

    text(p(1), p(2), p(3), sprintf(' P%d', k));
    text(pNew(1), pNew(2), pNew(3), sprintf(' Q%d', k));
end

axis equal;
grid on;
view(3);

xlabel('X');
ylabel('Y');
zlabel('Z');

title('Homogeneous transformation: Rx(45 deg) + translation');
legend('Original', 'Transformed', 'Location', 'best');

hold off;

exportgraphics(gcf, '../written/task2_1c.pdf', ...
    'ContentType', 'image','Resolution',300);


%% Task 2 - 1(d): Transform vectors between points

figure;

for k = 1:4
subplot(2, 2, k);
hold on;

a = [0; 0; 0];
b = P(:, k);

aNew = R*a + t;
bNew = R*b + t;

plotv3(a, b, 'b');
plotv3(aNew, bNew, 'r');

text(a(1), a(2), a(3), ' A');
text(b(1), b(2), b(3), ' B');
text(aNew(1), aNew(2), aNew(3), ' Anew');
text(bNew(1), bNew(2), bNew(3), ' Bnew');

axis equal;
grid on;
view(3);

xlabel('X');
ylabel('Y');
zlabel('Z');

title(sprintf('Vector example %d', k));
legend('Original', 'Transformed', 'Location', 'best');

hold off;
end

exportgraphics(gcf, '../written/task2_1d.pdf', ...
'ContentType', 'image', 'Resolution', 300);


%% Task 2 - 1(e): Line segments in homogeneous coordinates

figure;

for k = 1:4
    subplot(2, 2, k);
    hold on;

    a = [0; 0; 0; 1];
    b = P4(:, k);

    aNew = H*a;
    bNew = H*b;

    plotv4(a, b, 'b');
    plotv4(aNew, bNew, 'r');

    text(a(1), a(2), a(3), ' A');
    text(b(1), b(2), b(3), ' B');
    text(aNew(1), aNew(2), aNew(3), ' Anew');
    text(bNew(1), bNew(2), bNew(3), ' Bnew');

    axis equal;
    grid on;
    view(3);

    xlabel('X');
    ylabel('Y');
    zlabel('Z');

    title(sprintf('plotv4: example %d', k));
    legend('Original', 'Transformed', 'Location', 'best');

    hold off;
end

exportgraphics(gcf, '../written/task2_1e.pdf', ...
    'ContentType', 'image', 'Resolution', 300);


%% Task 2 - 1(f): Transform coordinate frames

frameAngles = [0, 0, 0, pi/4];
translations = [1, 0, 0,  0.5;
                0, 1, 0, -0.5;
                0, 0, 1,  0.5];

figure;

for k = 1:4
    subplot(2, 2, k);
    hold on;

    Rframe = ROTX(frameAngles(k));
    tframe = translations(:, k);

    Hframe = [Rframe, tframe;
              0, 0, 0, 1];

    plotf(eye(4), 'b', 0);
    plotf(Hframe, 'r', 1);

    axis equal;
    grid on;
    view(3);

    title({sprintf('Frame example %d: blue=original, red=transformed', k), ...
        sprintf('Rx=%.1f deg; t=[%.1f, %.1f, %.1f]', ...
        rad2deg(frameAngles(k)), tframe(1), tframe(2), tframe(3))});

    hold off;
end

exportgraphics(gcf, '../written/task2_1f.pdf', ...
    'ContentType', 'image', 'Resolution', 300);


%% Task 2 - 2: Check ROTY and ROTZ

ROTY(0)
ROTZ(0)

ROTY(pi/2) * [1; 0; 0]
ROTZ(pi/2) * [1; 0; 0]

H2 = [R*ROTY(pi/2)*ROTZ(pi/2) , zeros(3,1);
      0,0,0,1];

qValidate2 = H2* [1;0;0;1]


%% Task 2 - 3: Plot general rotations

angleSets = [0, pi/8, -pi/4,  pi/3;
    0, pi/4,  pi/6, -pi/8;
    0, pi/6,  pi/3,  pi/4];

figure;

for k = 1:4
    subplot(2, 2, k);

    anglesNow = angleSets(:, k);
    Rnow = EULERXYZ(anglesNow);

    plotr(Rnow);

    axis([-1, 1, -1, 1, -1, 1]);
    view(3);

    title({sprintf('EulerXYZ example %d', k), ...
        sprintf('[psi, theta, phi] = [%.1f, %.1f, %.1f]', ...
        rad2deg(anglesNow(1)), ...
        rad2deg(anglesNow(2)), ...
        rad2deg(anglesNow(3)))});
end

exportgraphics(gcf, '../written/task2_3.pdf', ...
    'ContentType', 'image', 'Resolution', 300);


%% Task 2 - 4: Check EULERXYZINV

anglesOriginal = [pi/6; pi/4; pi/3];

RForward = EULERXYZ(anglesOriginal);

anglesRecovered = EULERXYZINV(RForward)

RInverse = EULERXYZ(anglesRecovered);

reconstructionError = norm(RForward - RInverse, 'fro')


%% Task 2 - 4(a): Check 2*pi periodicity

testAngles = [ 0.3, -1.2,  2.4;
    -0.7,  0.6, -0.5;
    1.2, -0.8,  1.7];

for k = 1:3
    anglesA = testAngles(:, k);
    anglesB = anglesA + [2*pi; 0; 0];

    RA = EULERXYZ(anglesA);
    RB = EULERXYZ(anglesB);

    matrixDifference = norm(RA - RB, 'fro');

    fprintf('4(a), case %d: difference = %.3e\n', ...
        k, matrixDifference);
end


%% Task 2 - 4(b): Check singular configurations

singularAngles = [pi/6,  pi/6;
    pi/2, -pi/2;
    pi/3,  pi/3];

for k = 1:2
    anglesOriginal = singularAngles(:, k);

    Roriginal = EULERXYZ(anglesOriginal);
    anglesRecovered = EULERXYZINV(Roriginal);

    Rrecovered = EULERXYZ(anglesRecovered);

    reconstructionError = norm(Roriginal - Rrecovered, 'fro');

    fprintf('\n4(b), case %d\n', k);

    disp('Original [psi theta phi] in degrees:');
    disp(rad2deg(anglesOriginal)');

    disp('Recovered [psi theta phi] in degrees:');
    disp(rad2deg(anglesRecovered)');

    fprintf('Reconstruction error = %.3e\n', ...
        reconstructionError);
end


%% Task 2 - 4(c): Different angles, same rotation

anglesOriginal = [4*pi; 0; 0];

Roriginal = EULERXYZ(anglesOriginal);
anglesRecovered = EULERXYZINV(Roriginal);

disp('Original angles in radians:');
disp(anglesOriginal');

disp('Recovered angles in radians:');
disp(anglesRecovered');

angleDifference = norm(anglesOriginal - anglesRecovered);

Rrecovered = EULERXYZ(anglesRecovered);
matrixDifference = norm(Roriginal - Rrecovered, 'fro');

fprintf('Angle difference = %.6f rad\n', angleDifference);
fprintf('Matrix difference = %.3e\n', matrixDifference);


%% Task 2 - 4(d): Check rotation reconstruction

testAngles = [ 0.3, -1.2,   2.4, 4*pi;
    -0.7,  0.6, 2*pi/3,   0;
    1.2, -0.8,   1.7,   0];

for k = 1:4
    anglesOriginal = testAngles(:, k);

    Roriginal = EULERXYZ(anglesOriginal);

    anglesRecovered = EULERXYZINV(Roriginal);
    Rrecovered = EULERXYZ(anglesRecovered);

    reconstructionError = norm(Roriginal - Rrecovered, 'fro');

    fprintf('4(d), case %d: reconstruction error = %.3e\n', ...
        k, reconstructionError);
end


%% Task 2 - 7(a): Frames rotated using EXPCR

axisDirections = [1, 0, 0, 1;
    0, 1, 0, 1;
    0, 0, 1, 1];

rotationAngles = [pi/6, pi/4, pi/3, pi/2];

figure;

for k = 1:4
    subplot(2, 2, k);
    hold on;

    n = axisDirections(:, k);
    n = n/norm(n);

    x = rotationAngles(k)*n;
    Rexp = EXPCR(x);

    plotr(eye(3), 0);
    plotr(Rexp, 1);

    axis([-1, 1, -1, 1, -1, 1]);
    view(3);

    title({sprintf('Axis: [%.2f %.2f %.2f]', ...
        n(1), n(2), n(3)), ...
        sprintf('Angle: %.1f deg', ...
        rad2deg(rotationAngles(k))), ...
        '0 = original; 1 = rotated'});

    hold off;
end

exportgraphics(gcf, '../written/task2_7a.pdf', ...
    'ContentType', 'image', 'Resolution', 300);


%% Task 2 - 7(b): Vectors rotated using EXPCR

vectors = [0, 1, 1,  1;
    1, 0, 1, -1;
    1, 1, 0,  0];

figure;

for k = 1:4
    subplot(2, 2, k);
    hold on;

    n = axisDirections(:, k);
    n = n/norm(n);

    Rexp = EXPCR(rotationAngles(k)*n);

    v = vectors(:, k);
    vRotated = Rexp*v;

    origin = [0; 0; 0];

    plotv3(origin, v, 'b');
    plotv3(origin, vRotated, 'r');

    text(v(1), v(2), v(3), ' v0');
    text(vRotated(1), vRotated(2), vRotated(3), ' v1');

    axis equal;
    axis([-1.5, 1.5, -1.5, 1.5, -1.5, 1.5]);
    grid on;
    view(3);

    xlabel('X');
    ylabel('Y');
    zlabel('Z');

    title({sprintf('Axis: [%.2f %.2f %.2f]', ...
        n(1), n(2), n(3)), ...
        sprintf('Angle: %.1f deg', ...
        rad2deg(rotationAngles(k)))});

    legend('Original', 'Rotated', 'Location', 'best');

    hold off;
end

exportgraphics(gcf, '../written/task2_7b.pdf', ...
    'ContentType', 'image', 'Resolution', 300);


%% Task 2 - 10(a): Frames transformed using EXPCF

axisDirections = [1, 0, 0, 1;
    0, 1, 0, 1;
    0, 0, 1, 1];
rotationAngles = [pi/6, pi/4, pi/3, pi/2];

vInputs = [0.5,   0,   0,  0.3;
    0, 0.5,   0, -0.2;
    0,   0, 0.5,  0.4];

figure;

for k = 1:4
    subplot(2, 2, k);
    hold on;

    n = axisDirections(:, k);
    n = n/norm(n);

    w = rotationAngles(k)*n;
    v = vInputs(:, k);

    xi = [w; v];
    Hexp = EXPCF(xi);

    plotf(eye(4), 'b', 0);
    plotf(Hexp, 'r', 1);

    p = Hexp(1:3,4);

    axis equal;
    grid on;
    view(3);

    title({sprintf('Axis: [%.2f %.2f %.2f]', ...
        n(1), n(2), n(3)), ...
        sprintf('Angle: %.1f deg', ...
        rad2deg(rotationAngles(k))), ...
        sprintf('p: [%.2f %.2f %.2f]', ...
        p(1), p(2), p(3))});

    hold off;
end

sgtitle('Blue (0): original; Red (1): transformed');

exportgraphics(gcf, '../written/task2_10a.pdf', ...
    'ContentType', 'image', 'Resolution', 300);


%% Task 2 - 10(b): Line segments transformed using EXPCF

figure;

for k = 1:4
    subplot(2, 2, k);
    hold on;

    n = axisDirections(:, k);
    n = n/norm(n);

    w = rotationAngles(k)*n;
    v = vInputs(:, k);

    Hexp = EXPCF([w; v]);

    R = Hexp(1:3,1:3);
    p = Hexp(1:3,4);

    a = [0; 0; 0];
    b = vectors(:, k); %defined in step 7a

    aNew = R*a + p;
    bNew = R*b + p;

    plotv3(a, b, 'b');
    plotv3(aNew, bNew, 'r');

    text(a(1), a(2), a(3), ' A');
    text(b(1), b(2), b(3), ' B');
    text(aNew(1), aNew(2), aNew(3), ' Anew');
    text(bNew(1), bNew(2), bNew(3), ' Bnew');

    axis equal;
    grid on;
    view(3);

    xlabel('X');
    ylabel('Y');
    zlabel('Z');

    title({sprintf('Axis: [%.2f %.2f %.2f]', ...
        n(1), n(2), n(3)), ...
        sprintf('Angle: %.1f deg', ...
        rad2deg(rotationAngles(k)))});

    legend('Original', 'Transformed', 'Location', 'best');

    hold off;
end

exportgraphics(gcf, '../written/task2_10b.pdf', ...
    'ContentType', 'image', 'Resolution', 300);


%% Task 2 - 11: Check FINV

inverseTestInputs = [0, 0,    0,  0.3;
    0, 0,    0, -0.2;
    0, 0, pi/2,  0.4;
    0, 1,    0,  0.5;
    0, 2,    0, -0.3;
    0, 3,    0,  0.2];

for k = 1:4
    Htest = EXPCF(inverseTestInputs(:, k));
    Hinv = FINV(Htest);

    leftError = norm(Hinv*Htest - eye(4), 'fro');
    rightError = norm(Htest*Hinv - eye(4), 'fro');

    fprintf('11, case %d: left error = %.3e, right error = %.3e\n', ...
        k, leftError, rightError);
end



%% AI assistance disclosure
% ChatGPT provided explanations, code suggestions, and debugging
% some small-angle handling advice(ex:in EXPECF), plot formatting and annotations,
% automatic figure export, and numerical test design.





