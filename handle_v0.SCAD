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


// z0 = 0;
z1 = 1;
z2 = 3;
z3 = 6;
z4 = 200;

// quarterHandle(xs0,xs1,xs3,xl0,xl1,xl3,ys0,ys1,ys3,yl0,yl1,yl3,z4);

// // for test if polyhedron is properly build or not 1
// difference() {
// 	translate([0,0,1]) cylinder (h = 250, r=20, center = false, $fn=100);
//     quarterHandle(xs0,xs1,xs3,xl0,xl1,xl3,ys0,ys1,ys3,yl0,yl1,yl3,z4);
// }
// // for test if polyhedron is properly build or not 2
// difference() {
//    quarterHandle(xs0,xs1,xs3,xl0,xl1,xl3,ys0,ys1,ys3,yl0,yl1,yl3,z4);
// 	translate([0,0,1]) cylinder (h = 250, r=10, center = false, $fn=100);
// }

module handle(xs0,xs1,xs3,xl0,xl1,xl3,ys0,ys1,ys3,yl0,yl1,yl3,z0,z1,z2,z3,z4)
    union(){
        halfHandle(xs0,xs1,xs3,xl0,xl1,xl3,ys0,ys1,ys3,yl0,yl1,yl3,z0,z1,z2,z3,z4);
        mirror(v=[0,1,0]) halfHandle(xs0,xs1,xs3,xl0,xl1,xl3,ys0,ys1,ys3,yl0,yl1,yl3,z0,z1,z2,z3,z4);
    }

module halfHandle(xs0,xs1,xs3,xl0,xl1,xl3,ys0,ys1,ys3,yl0,yl1,yl3,z0,z1,z2,z3,z4)
    union(){
        quarterHandle(xs0,xs1,xs3,xl0,xl1,xl3,ys0,ys1,ys3,yl0,yl1,yl3,z0,z1,z2,z3,z4);
        mirror(v=[1,0,0]) quarterHandle(xs0,xs1,xs3,xl0,xl1,xl3,ys0,ys1,ys3,yl0,yl1,yl3,z0,z1,z2,z3,z4);
    }

module quarterHandle(xs0,xs1,xs3,xl0,xl1,xl3,ys0,ys1,ys3,yl0,yl1,yl3,z0,z1,z2,z3,z4) {

    polyhedron(
    points=[
        [0,0,z0],[xl0,0,z0],[xl0,ys1,z0],[xs0,yl0,z0],[0,yl0,z0],      // points  0 to  4 for small tilted planes at the bottom
        [0,0,z1],[xl1,0,z1],[xl1,ys1,z1],[xs1,yl1,z1],[0,yl1,z1], // points  5 to  9 at base flat planes
        [0,0,z2],[xl1,0,z2],[xl1,ys1,z2],[xs1,yl1,z2],[0,yl1,z2], // points 10 to 14 for tilted planes
        [0,0,z3],[xl3,0,z3],[xl3,ys3,z3],[xs3,yl3,z3],[0,yl3,z3], // points 15 to 19 for flat planes (bottom side)
        [0,0,z4],[xl3,0,z4],[xl3,ys3,z4],[xs3,yl3,z4],[0,yl3,z4]  // points 20 to 24 for flat planes (top side)
    ],
    faces=[
        [1,   6,   7,   2   ],[2,   7,   8,   3   ],[3,   8,   9,   4   ],
        [1+ 5,6+ 5,7+ 5,2+ 5],[2+ 5,7+ 5,8+ 5,3+ 5],[3+ 5,8+ 5,9+ 5,4+ 5],
        [1+10,6+10,7+10,2+10],[2+10,7+10,8+10,3+10],[3+10,8+10,9+10,4+10],
        [1+15,6+15,7+15,2+15],[2+15,7+15,8+15,3+15],[3+15,8+15,9+15,4+15],
        [0,20,21,16,11,6,1],[0,4,9,14,19,24,20], // 2 inside planes (to be hidden later), bottom side
        [20,24,23,22,21],// top face
        [0,1,2,3,4]// bottom face
     ]
 );
}



