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

quarterHandle(xs0,xs1,xs3,xl0,xl1,xl3,ys0,ys1,ys3,yl0,yl1,yl3,z4);

module handle(xs0,xs1,xs3,xl0,xl1,xl3,ys0,ys1,ys3,yl0,yl1,yl3,z4)
    union(){
        halfHandle(xs0,xs1,xs3,xl0,xl1,xl3,ys0,ys1,ys3,yl0,yl1,yl3,z4);
        mirror(v=[0,1,0]) halfHandle(xs0,xs1,xs3,xl0,xl1,xl3,ys0,ys1,ys3,yl0,yl1,yl3,z4);
    }

module halfHandle(xs0,xs1,xs3,xl0,xl1,xl3,ys0,ys1,ys3,yl0,yl1,yl3,z4)
    union(){
        quarterHandle(xs0,xs1,xs3,xl0,xl1,xl3,ys0,ys1,ys3,yl0,yl1,yl3,z4);
        mirror(v=[1,0,0]) quarterHandle(xs0,xs1,xs3,xl0,xl1,xl3,ys0,ys1,ys3,yl0,yl1,yl3,z4);
    }

module quarterHandle(xs0,xs1,xs3,xl0,xl1,xl3,ys0,ys1,ys3,yl0,yl1,yl3,z4) {

    polyhedron(
    points=[
        [0,0, 0],[xl0,0, 0],[xl0,ys1, 0],[xs0,yl1, 0],[0,yl1, 0],      // points  0 to  4 for small tilted planes at the bottom
        [0,0,z1],[xl1,0,z1],[xl1,ys1,z1],[xs1,yl1,z1],[0,yl1,z1], // points  5 to  9 at base flat planes
        [0,0,z2],[xl1,0,z2],[xl1,ys1,z2],[xs1,yl1,z2],[0,yl1,z2], // points 10 to 14 for tilted planes
        [0,0,z3],[xl3,0,z3],[xl3,ys3,z3],[xs3,yl3,z3],[0,yl3,z3], // points 15 to 19 for flat planes (bottom side)
        [0,0,z4],[xl3,0,z4],[xl3,ys3,z4],[xs3,yl3,z4],[0,yl3,z4]  // points 20 to 24 for flat planes (top side)
    ],
    faces=[
        [1,2,7,6],[2,3,8,7],[3,4,9,8],
        [6,7,12,11],[7,8,13,12],[8,9,14,13],
        [11,12,17,16],[12,13,18,17],[13,14,19,18],        // for tilted planes, of which 3 triangles can be seen from y direction
        [16,17,22,21],[17,18,23,22],[18,19,24,23],  // 3 flat(long) planes
        // [19,15,20,24],[15,16,21,20],              // 2 inside triangles (to be hidden later), flat plain
        [0,1,6,11,16,21,20],[0,4,9,14,19,24,20], // 2 inside planes (to be hidden later), bottom side
        [20,21,22,23,24],                     // top face
        [0,4,3,2,1],                     // bottom face

     ]
 );
}



