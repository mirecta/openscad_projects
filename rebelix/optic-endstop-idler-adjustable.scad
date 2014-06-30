/*translate([8,0])rotate([0,-90,0])color([0.0,0.8,0.,0.15])
translate([0,0]){
cube([17,10,1.5]);
cube([5,2,8]);
}*/
use <MCAD/nuts_and_bolts.scad>

difference(){
cube([14.5,10,5]);
translate([0,0,-10]){
translate([2.8,10-4,-0.1])cylinder(r=3.2/2,h=25,$fn=20);
translate([14.5-2.8,10-4,-0.1])cylinder(r=3.2/2,h=25,$fn=20);
}
translate([14.5/2,10-4,-10])cylinder(r=3.2/2,h=20,$fn=20);
translate([14.5/2,10-4,3])rotate([0,0,90])nutHole(3);
}

translate([0,15,8])
rotate([-90,0,0])
difference(){
union(){
cube([14.5,8,4]);
translate([14.5/2-1.5/2,2])cube([1.5,6,15]);
}
translate([2.8,10-4-2,-0.1])cylinder(r=3.2/2,h=10,$fn=20);
translate([14.5-2.8,10-4-2,-0.1])cylinder(r=3.2/2,h=10,$fn=20);
}