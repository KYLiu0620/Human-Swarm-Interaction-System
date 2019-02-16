SlaveRobotNum = 6;
SlaveRobotDOF = 3;
t= 0:tout(end)/(length(q_s)-1):tout(end);
% %% swarm plot
% figure(1)
% %3D
% hold on
% view(35,35);
% xlabel('x');
% ylabel('y');
% zlabel('z');
% xlim = 2;
% ylim = 3;
% zlim = 1;
% axis([-xlim xlim -ylim ylim -zlim zlim]);
% space = 125;
% for i = 1:space:length(t)-space
%     for num = [1 4 7 10 13 16]
%         plot3(q_s(i:i+space,num),q_s(i:i+space,num+1),q_s(i:i+space,num+2),'b.');
%         drawnow
%     end
% end
% hold off
% 
% %% command plot
% figure(2)
% hold on
% view(35,35);
% xlabel('x');
% ylabel('y');
% zlabel('z');
% axis([40 80 30 120 48 56]);
% space = 125;
% for i = 1:space:length(t)-space
%     num = 4;
%     plot3(X_m(i:i+space,num),X_m(i:i+space,num+1),X_m(i:i+space,num+2),'-b');
%     drawnow
%     
% end
% hold off

%% combine
%3D
h = figure(3);
VW = VideoWriter('test.avi');
open(VW);
space = 25;
for i = 1:space:length(t)-space
    %swarm trajectory
    subplot(2,1,1)
    hold on
    title('swarm position')
    view(35,35);
    xlabel('x');
    ylabel('y');
    zlabel('z');
    xlim = 2;
    ylim = 3;
    zlim = 1;
    axis([-xlim xlim -ylim ylim -zlim zlim]);
    for num = [1 4 7 10 13 16]
        plot3(q_s(i:i+space,num),q_s(i:i+space,num+1),q_s(i:i+space,num+2),'b.');
        %drawnow
    end
    hold off
    %end effector trajectory
    subplot(2,1,2)
    hold on
    title('end effector position (user command)')
    view(35,35);
    xlabel('x');
    ylabel('y');
    zlabel('z');
    axis([min(X_m(:,4))-10 max(X_m(:,4))+10 ...
        min(X_m(:,4+1))-10 max(X_m(:,4+1))+10 ...
        min(X_m(:,4+2))-10 max(X_m(:,4+2))+10]);
    num = 4;
    plot3(X_m(i:i+space,num),X_m(i:i+space,num+1),X_m(i:i+space,num+2),'-b');
    hold off
    drawnow
    
    frame = getframe(h);
%     writeVideo(VW,frame);
end
close(VW)

