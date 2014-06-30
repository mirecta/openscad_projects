use <MCAD/nuts_and_bolts.scad>;

difference(){
translate([-17.3/2,0,0])
union(){
cube([17.3,11,46]);

}

translate([0,15,23])rotate([90,0,0])#cylinder(r=6.2/2,h = 20,$fn=20);
translate([0,6,23])rotate([90,0,0])scale([1,1,1.5])#nutHole(6);

translate([0,15,10])rotate([90,0,0])#cylinder(r=5.2/2, h=20, $fn=20);
translate([0,11+1,10])rotate([90,0,0])scale([1,1,1.5])#nutHole(5);

translate([0,15,36])rotate([90,0,0])#cylinder(r=5.2/2, h=20, $fn=20);
translate([0,11+1,36])rotate([90,0,0])scale([1,1,1.5])#nutHole(5);
}