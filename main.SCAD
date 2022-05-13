include <handle_v0.SCAD>;
// include <symple_shell.SCAD>;
include <round_shell.SCAD>;
include <cpp_mesh_seed.SCAD>;


xs0 = 5;
xs1 = 6;
xs3 = 6;

xl0 = 12;
xl1 = 15;
xl3 = 12;

ys0 = 6;
ys1 = 5;
ys3 = 5;

yl0 = 11;
yl1 = 13;
yl3 = 10;

z0 = 0;
z1 = 1;
z2 = 3;
z3 = 6;
z4 = 200;

// thickness
t = 1;
// ts = 1;

// cpp_mesh_seed parameters
lc = 4;

difference(){
    RoundShell(xs0,xs1,xs3,xl0,xl1,xl3,ys0,ys1,ys3,yl0,yl1,yl3,z0,z1,z2,z3,z4,t);
    // cpp_mesh_seed(lc, xl1+2, yl1+2, z4);
}


