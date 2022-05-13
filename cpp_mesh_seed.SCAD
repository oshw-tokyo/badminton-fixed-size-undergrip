lc = 4;

lx = 2;
ly = 2;
lz = 3;

// cpp_mesh_seed(lc,lx,ly,lz);

module cpp_mesh_seed(lc,lx,ly,lz){
    for (k=[-lc:0.5*lz/lc]) {
        for (j=[-0.5*ly/lc:0.5*ly/lc]) {
            for (i=[-0.5*lx/lc:0.5*lx/lc]){
                translate([2*i*lc,2*j*lc,2*k*lc])
                    ccp_unit(lc);
            }
        }
    }
}


// ccp_unit(lc);

module ccp_unit(lc){
    interfere_rate = 1.05;
    r_l = 0.75*lc;
    r_s = (interfere_rate - r_l/lc)*lc;

    translate([-lc/2,-lc/2,-lc/2]){
        translate([   0,    0,    0]) sphere(r=r_l, $fn=  12);
        translate([1*lc, 1*lc,    0]) sphere(r=r_l, $fn=  12);
        translate([1*lc,    0, 1*lc]) sphere(r=r_l, $fn=  12);
        translate([   0, 1*lc, 1*lc]) sphere(r=r_l, $fn=  12);

        translate([1*lc,    0,    0]) sphere(r=r_s, $fn=  12);
        translate([   0, 1*lc,    0]) sphere(r=r_s, $fn=  12);
        translate([   0,    0, 1*lc]) sphere(r=r_s, $fn=  12);
        translate([1*lc, 1*lc, 1*lc]) sphere(r=r_s, $fn=  12);
    }
}
