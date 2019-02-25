SlaveRobotNum = 6;
SlaveRobotDOF = 3;
t= 0:tout(end)/(length(q_s)-1):tout(end);
record_switch = false;
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
set( h, 'Position', [80 190 1000 450])
if record_switch
    VW = VideoWriter('test.avi');
    open(VW);
end
space = 125;
for i = 1:space:length(t)-space
    %swarm trajectory
    subplot(3,2,[1 3 5])
    hold on
    title('swarm position')
    view(35,35);
    xlabel('x');
    ylabel('y');
    zlabel('z');
    all_x = [q_s(:,1);q_s(:,4);q_s(:,7);q_s(:,10);q_s(:,13);q_s(:,16)];
    all_y = [q_s(:,2);q_s(:,5);q_s(:,8);q_s(:,11);q_s(:,14);q_s(:,17)];
    all_z = [q_s(:,3);q_s(:,6);q_s(:,9);q_s(:,12);q_s(:,15);q_s(:,18)];   
    axis([min(all_x)-1 max(all_x)+1 ...
        min(all_y)-1 max(all_y)+1 ...
        min(all_z)-1 max(all_z)+1]);
    for num = [1 4 7 10 13 16]
        plot3(q_s(i:i+space,num),q_s(i:i+space,num+1),q_s(i:i+space,num+2),'b.');
        %drawnow
    end
    hold off
    
    %     %end effector trajectory
    %     subplot(2,1,2)
    %     hold on
    %     title('end effector position (user command)')
    %     view(35,35);
    %     xlabel('x');
    %     ylabel('y');
    %     zlabel('z');
    %     axis([min(X_m(:,4))-10 max(X_m(:,4))+10 ...
    %         min(X_m(:,4+1))-10 max(X_m(:,4+1))+10 ...
    %         min(X_m(:,4+2))-10 max(X_m(:,4+2))+10]);
    %     num = 4;
    %     plot3(X_m(i:i+space,num),X_m(i:i+space,num+1),X_m(i:i+space,num+2),'-b');
    %     hold off
    %     drawnow
    
    %end effector trajectory of each axis
    for j = 1:3
        subplot(3,2,2*j)
        hold on
        xlabel('t(s)');
        switch j
            case 1
                title('end effector position (user command)')
                ylabel('x');
            case 2
                ylabel('y');
            case 3
                ylabel('z');
        end
        num = j+3; %3 for first task space
        axis([0 t(end) ...
            min([X_m(:,num);v_f(:,j)./0.02])-5 max([X_m(:,num);v_f(:,j)./0.02])+5]);
        plot(t(i:i+space), X_m(i:i+space,num),'-b',...
            t(i:i+space), v_f(i:i+space,j)/0.02,'--r');
        hold off
        drawnow
        
    end
    
    if record_switch        
        frame = getframe(h);
        writeVideo(VW,frame);
    end
end

if record_switch
    close(VW)
end
