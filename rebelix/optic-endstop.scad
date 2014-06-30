include <MCAD/nuts_and_bolts.scad>

difference(){
union(){
translate([0,-25/2])cube([3.5,25,10]);
hull(){
translate([15.3/2,0])cylinder(r=15.3/2,h=10,$fn=30);
translate([23,-15.3/2])cube([.5,15.3,10]);
}
translate([23.5-5.5-2*2,-3-15.3/2])cube([5.5+2*2,3,10]);
}
translate([0,19/2,5])rotate([0,90])#cylinder(r=3.3/2,h=10,$fn=20);
translate([0,-19/2,5])rotate([0,90])#cylinder(r=3.3/2,h=10,$fn=20);
#hull(){
translate([8.3/2+3.5,0])cylinder(r=8.3/2,h=10,$fn=30);
translate([23,-8.3/2])cube([0.5,8.3,10]);
}
translate([23.5-5,15,5])rotate([90,0])#cylinder(r=3.3/2,h=30,$fn=20);
translate([23.5-5,-15.3/2-1,5])rotate([90,0])#nutHole(3);

}