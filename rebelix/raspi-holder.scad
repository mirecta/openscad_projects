// RebeliX
//
// corner coupler
// GNU GPL v3
// Martin Neruda <neruda@reprap4u.cz>
// http://www.reprap4u.cz
// Inspired by Rebel II

// Postacuji i 4 mm
base_thickness = 4;


difference(){
union(){
cube([base_thickness,30,26]);
translate([-1.5,30/2-4])cube([1.5,8,26]);
cube([25,4,26]);
translate([25-4,-13])cube([4,13,26]);
}
translate([-2,30/2,26/2])rotate([0,90])#cylinder(r=6.3/2,h=8,$fn=20);
}