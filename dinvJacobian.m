clc
syms q1(t) q2(t) q3(t) dq1(t) dq2(t) dq3(t) L1 L2;

j11 = -L1*cos( q1 )*cos( q2 ) - L2*cos( q1 )*cos( q2 )*sin( q3 ) - L2*cos( q1 )*sin( q2 )*cos( q3 );
j12 = L2*sin( q1 )*sin( q2 )*sin( q3 ) + L1*sin( q1 )*sin( q2 ) - L2*sin( q1 )*cos( q2 )*cos( q3 );
j13 = -L2*sin( q1 )*cos( q2 )*cos( q3 ) + L2*sin( q1 )*sin( q2 )*sin( q3 );
j22 = L2*sin( q2 )*cos( q3 ) + L2*cos( q2 )*sin( q3 ) + L1*cos( q2 );
j23 = L2*cos( q2 )*sin( q3 ) + L2*sin( q2 )*cos( q3 );
j31 = -L2*sin( q1 )*sin( q2 )*cos( q3 ) - L1*sin( q1 )*cos( q2 ) - L2*sin( q1 )*cos( q2 )*sin( q3 );
j32 = L2*cos( q1 )*cos( q2 )*cos( q3 ) - L2*cos( q1 )*sin( q2 )*sin( q3 ) - L1*cos( q1 )*sin( q2 );
j33 = L2*cos( q1 )*cos( q2 )*cos( q3 ) - L2*cos( q1 )*sin( q2 )*sin( q3 );

J = [ j11 j12 j13;
       0  j22 j23;
      j31 j32 j33];
invJ = inv(J);
%% 
dinvJ = diff(invJ,t);
dinvJ_body = formula(dinvJ);
dinvJ11 = dinvJ_body(1,1)
dinvJ12 = dinvJ_body(1,2)
dinvJ13 = dinvJ_body(1,3)
dinvJ21 = dinvJ_body(2,1)
dinvJ22 = dinvJ_body(2,2)
dinvJ23 = dinvJ_body(2,3)
dinvJ31 = dinvJ_body(3,1)
dinvJ32 = dinvJ_body(3,2)
dinvJ33 = dinvJ_body(3,3)