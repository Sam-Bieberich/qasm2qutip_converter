OPENQASM 2.0;
include "qelib1.inc";
gate iswap q0,q1 { s q0; s q1; h q0; cx q0,q1; cx q1,q0; h q1; }
gate rzx(param0) q0,q1 { h q1; cx q0,q1; rz(param0) q1; cx q0,q1; h q1; }
gate ecr q0,q1 { rzx(pi/4) q0,q1; x q0; rzx(-pi/4) q0,q1; }
gate dcx q0,q1 { cx q0,q1; cx q1,q0; }
qreg q[3];
swap q[0],q[2];
iswap q[2],q[0];
id q[0];
id q[0];
z q[1];
cx q[0],q[2];
iswap q[2],q[0];
sdg q[0];
z q[1];
x q[0];
z q[1];
x q[0];
sdg q[1];
z q[2];
ecr q[2],q[1];
dcx q[0],q[2];
id q[2];
ecr q[1],q[0];
cz q[0],q[1];
x q[0];
