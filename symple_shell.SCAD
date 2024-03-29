include <handle_v0.SCAD>;

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
module shell(xs0,xs1,xs3,xl0,xl1,xl3,ys0,ys1,ys3,yl0,yl1,yl3,z0,z1,z2,z3,z4,t){
    difference() {
        handle(xs0+t,xs1+t,xs3+t,xl0+t,xl1+t,xl3+t,ys0+t,ys1+t,ys3+t,yl0+t,yl1+t,yl3+t,z0,z1,z2,z3,z4);

        //     quarterHandle(xs0+ts,xs1+ts,xs3+ts,xl0+tl,xl1+tl,xl3+tl,ys0+ts,ys1+ts,ys3+ts,yl0+tl,yl1+tl,yl3+tl,z4);
        handle(xs0,xs1,xs3,xl0,xl1,xl3,ys0,ys1,ys3,yl0,yl1,yl3,z0,z1,z2,z3,z4+t);
    }
}
