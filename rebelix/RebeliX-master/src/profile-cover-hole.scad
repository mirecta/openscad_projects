// RebeliX
//
// profile-cover-hole
// GNU GPL v3
// Martin Neruda <neruda@reprap4u.cz>
// http://www.reprap4u.cz

include <../configuration.scad>

difference(){
	union(){
		cube([30,30,4*layer_height]);
		translate([15-5,15-5,0]) cube([10,10,5]);
	}	
	// Nabeh
	translate([0,15-5,4.7]) rotate([45,0,0]) cube([40,3,3]);
	translate([0,15+5,4.7]) rotate([45,0,0]) cube([40,3,3]);
	translate([15-5,0,4.7]) rotate([45,0,90]) cube([40,3,3]);
	translate([15+5,0,4.7]) rotate([45,0,90]) cube([40,3,3]);
	// Otvor pro napajeci kabely
	translate([15,15,2]) cube([10-4*extrusion_width-0.1,10-4*extrusion_width-0.1,10], center=true);
}	