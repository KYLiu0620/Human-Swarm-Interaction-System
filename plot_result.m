SlaveRobotNum = 6;
SlaveRobotDOF = 3;
t= 0:tout(end)/(length(q_s)-1):tout(end);
%% swarm plot

figure(1)
subplot(2,2,1) %xy
hold on
for num = [1 4 7 10 13 16]
    plot(q_s(1,num),q_s(1,num+1),'o');
    plot(q_s(:,num),q_s(:,num+1));
end
xlabel('x');
ylabel('y');
hold off

subplot(2,2,2) %yz
hold on
for num = [1 4 7 10 13 16]
    plot(q_s(1,num+1),q_s(1,num+2),'o');
    plot(q_s(:,num+1),q_s(:,num+2));
end
xlabel('y');
ylabel('z');
hold off

% figure(2)
subplot(2,2,3) %xz
hold on
for num = [1 4 7 10 13 16]
    plot(q_s(1,num),q_s(1,num+2),'o');
    plot(q_s(:,num),q_s(:,num+2));
end
xlabel('x');
ylabel('z');
hold off

% figure(3)
subplot(2,2,4) %3D
hold on
for num = [1 4 7 10 13 16]
    plot3(q_s(1,num),q_s(1,num+1),q_s(1,num+2),'o');
    plot3(q_s(:,num),q_s(:,num+1),q_s(:,num+2));
    drawnow
end
plot3(X_m(:,1),X_m(:,2),X_m(:,3),'--');
xlabel('x');
ylabel('y');
zlabel('z');
hold off

figure(2)
index=4;
suptitle(['robot ' num2str(index)]);
subplot(2,1,1)
plot(t,q_s(:,index));
subplot(2,1,2)
plot(t,q_s(:,index+1));
%% master plot
