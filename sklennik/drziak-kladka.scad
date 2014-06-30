use <MCAD/nuts_and_bolts.scad>;

difference(){
translate([-17.3/2,0,0])
union(){
cube([17.3,10.5,17.3+2.5*2]);
translate([-2.5,-7,0])cube([17.3+2.5*2,7,17.3+2.5*2]);
}

translate([0,12,(17.3+2.5*2)/2])rotate([90,0,0])#cylinder(r=6.2/2,h = 20,$fn=20);
translate([0,-2.01,(17.3+2.5*2)/2])rotate([90,0,0])#nutHole(6);
}