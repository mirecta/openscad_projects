include <MCAD/nuts_and_bolts.scad>
gap = 7.4;
difference(){
union(){
translate([0,-25/2])cube([3.5,25,10]);
hull(){
translate([15.3/2,0])cylinder(r=15.3/2,h=10,$fn=30);
translate([23,-15.3/2])cube([.5,15.3,10]);
}
translate([23.5-5.5-2*2,-3-15.3/2])cube([5.5+2*2,3,10]);
}
translate([-0.1,19/2,5])rotate([0,90])#cylinder(r=3.3/2,h=10,$fn=20);
translate([-0.1,-19/2,5])rotate([0,90])#cylinder(r=3.3/2,h=10,$fn=20);

translate([3.51,19/2,5])rotate([0,90])rotate([0,0,90])#nutHole(3);
translate([3.51,-19/2,5])rotate([0,90])rotate([0,0,90])#nutHole(3);
#hull(){
translate([gap/2+3.5,0])cylinder(r=gap/2,h=10,$fn=30);
translate([23,-gap/2])cube([0.5,gap,10]);
}
translate([8.3/2+3.5,0])cylinder(r=8.3/2,h=10,$fn=30);

translate([23.5-5,15,5])rotate([90,0])#cylinder(r=3.3/2,h=30,$fn=20);
translate([23.5-5,-15.3/2-1,5])rotate([90,0])#nutHole(3);

}