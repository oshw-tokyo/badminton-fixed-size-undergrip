
xtf = 6;
xwf = 12;

ytf= 10;
ywf = 5;

xtb = 9;
xwb = 15;

ytb= 13;
ywb = 8;

zb = 6;
zm = 200;

handle(xtf,xwf,ytf,ywf,xtb,xwb,ytb,ywb,zb,zm);

module handle(xtf,xwf,ytf,ywf,xtb,xwb,ytb,ywb,zb,zm)
    union(){
        halfHandle(xtf,xwf,ytf,ywf,xtb,xwb,ytb,ywb,zb,zm);
        mirror(v=[0,1,0]) halfHandle(xtf,xwf,ytf,ywf,xtb,xwb,ytb,ywb,zb,zm);
    }

module halfHandle(xtf,xwf,ytf,ywf,xtb,xwb,ytb,ywb,zb,zm)
    union(){
        quarterHandle(xtf,xwf,ytf,ywf,xtb,xwb,ytb,ywb,zb,zm);
        mirror(v=[1,0,0]) quarterHandle(xtf,xwf,ytf,ywf,xtb,xwb,ytb,ywb,zb,zm);
    }

module quarterHandle(xtf,xwf,ytf,ywf,xtb,xwb,ytb,ywb,zb,zm) {
    polyhedron(
    points=[
        [0,0,0],[xwb,0,0],[xwb,ywb,0],[xtb,ytb,0],[0,ytb,0],      // 5 points 0,1,2,3,4 at base
        [0,0,zb],[xwf,0,zb],[xwf,ywf,zb],[xtf,ytf,zb],[0,ytf,zb], // points  5, 6, 7, 8, 9 for flat planes (bottom side)
        [0,0,zm],[xwf,0,zm],[xwf,ywf,zm],[xtf,ytf,zm],[0,ytf,zm]  // points 10,11,12,13,14 for flat planes (top side)
    ],
    faces=[
        [4,3,2,1,0],                    // bottom face
         [1,2,7,6],[2,3,8,7],[3,4,9,8],               // for tilted planes, of which 3 triangles can be seen from y direction
        [6,7,12,11],[7,8,13,12],[8,9,14,13],         // 3 flat(long) planes
        [9,5,10,14],[5,6,11,10],      // 2 inside triangles (to be hidden later), flat plain
        [0,1,6,5],[0,5,9,4],            // 2 inside planes (to be hidden later), bottom side
        // [10,11,12],[10,12,13],[10,13,14],               // top face
        [10,11,12,13,14],               // top face

     ]
 );
}



