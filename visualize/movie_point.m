function  movie_point(A)
N = A.N;


range =1*[-1 1 -1 1 -1 1];

    
    
set(gca,'nextplot','replacechildren'); 
v = VideoWriter('test.avi');
open(v);
for i = 1:1:N
 
    
    q_x = A.q(1,i);
    q_y = A.q(2,i);
    q_z = A.q(3,i);
    
    [Xs,Ys,Zs] = sphere(24); 
    Xs = 0.01*Xs+q_x;
    Ys = 0.01*Ys+q_y;
    Zs = 0.01*Zs+q_z;
    surf(Xs,Ys,Zs,'FaceColor',[1 1 0],'Linestyle','-'); 
    hold on
    [X,Y] = meshgrid(range(1):range(2)-range(1):range(2),range(3):range(4)-range(3):range(4));
	Z = X.*0+Y.*0;
    surf(X,Y,Z,'FaceColor','k','FaceAlpha',0.1,'Linestyle','-');  
    
    axis('equal');
    axis(range);
    xlabel('x (meter)');
    ylabel('y (meter)');
    zlabel('z (meter)');
    
    
    view([22,22]);
    frame = getframe(gcf);
    writeVideo(v,frame);
end
close(v);
end




