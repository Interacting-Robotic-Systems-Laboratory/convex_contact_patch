function  movie_cuboid(A)
N = A.N;


L_r = A.dim(1)*A.unit;
W_r = A.dim(2)*A.unit;
H_r = A.dim(3)*A.unit;

range =3*[-0.5 0.5 -0.5 0.5 0 1];

    
    
set(gca,'nextplot','replacechildren'); 
v = VideoWriter('test.avi');
open(v);
for i = 1:N
    q0 = A.q(4,i);
    q1 = A.q(5,i);
    q2 = A.q(6,i);
    q3 = A.q(7,i);
    
    q_x = A.q(1,i);
    q_y = A.q(2,i);
    q_z = A.q(3,i);
    
    E = [-q1 q0 -q3 q2;
     -q2 q3 q0 -q1;
     -q3 -q2 q1 q0];

    G = [-q1 q0 q3 -q2;
         -q2 -q3 q0 q1;
         -q3 q2 -q1 q0];
 
    R = E*G';
    
    H = [R,[q_x;q_y;q_z];zeros(1,3),1];
    
    
    
    
    [x,y,z] = mashgrid_cuboid(L_r,W_r,H_r,H,[0;0;0]);
    
    
    surf(x,y,z,'FaceColor',[1 1 0],'FaceAlpha',0.2);
    hold on
    plot3(A.z(7,i),A.z(8,i),A.z(9,i),'r.');
    hold on
    [X,Y] = meshgrid(range(1):range(2)-range(1):range(2),range(3):range(4)-range(3):range(4));
	Z = X.*0+Y.*0;
    surf(X,Y,Z,'FaceColor','k','FaceAlpha',0.1,'Linestyle','-');
    
    axis('equal');
    axis(range);
    xlabel('x (meter)');
    ylabel('y (meter)');
    zlabel('z (meter)');
    
    
    hold off
    frame = getframe(gcf);
    writeVideo(v,frame);
end
close(v);
end




