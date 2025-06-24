OPENQASM 2.0;
include "qelib1.inc";
gate iswap q0,q1 { s q0; s q1; h q0; cx q0,q1; cx q1,q0; h q1; }
gate rzx(param0) q0,q1 { h q1; cx q0,q1; rz(param0) q1; cx q0,q1; h q1; }
gate ecr q0,q1 { rzx(pi/4) q0,q1; x q0; rzx(-pi/4) q0,q1; }
gate dcx q0,q1 { cx q0,q1; cx q1,q0; }
qreg q[3];
cx q[1],q[0];
sdg q[1];
iswap q[0],q[2];
cx q[2],q[0];
ecr q[0],q[2];
sdg q[1];
x q[2];
h q[1];
swap q[1],q[0];
dcx q[1],q[0];
cy q[2],q[0];
iswap q[0],q[1];
cx q[2],q[0];
iswap q[0],q[1];
swap q[0],q[1];
cz q[2],q[0];
cz q[2],q[0];
x q[2];
iswap q[0],q[1];
s q[0];
