
function x = myStateTransitionFcn(x)
% Sample time [s]
dt = 0.01; 

x1 = x(1);
x2 = x(2);
x3 = x(3);
x4 = x(4);
x5 = x(5);
x6 = x(6);

x = x + [x4;x5;x6;0;0;0]*dt;

end

