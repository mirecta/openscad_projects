// RebeliX
//
// corner coupler
// GNU GPL v3
// Martin Neruda <neruda@reprap4u.cz>
// http://www.reprap4u.cz
// Inspired by Rebel II

// Postacuji i 4 mm
base_thickness = 6.5;

module base(){
difference(){
	union(){
		translate([0,-10])cube([35,50,base_thickness]);
       translate([35,0])cube([30,30,base_thickness], center = false);
		//translate([11,0,0])cube([8,30,base_thickness+1.5]);
		translate([65,30/2-4,0])rotate(90,0,0)cube([8,28.5,base_thickness+1.5]);
		}
		
		//translate([11+4,30/2,-0.1])cylinder(h=10,r=3.1,$fn=32);
		translate([65-30/2,30/2,-0.1])cylinder(h=10,r=3.1,$fn=32);
}
}

translate([0,30])difference(){
translate([0,10])base();
translate([15,12.5])cylinder(r=3.3/2,h=10,$fn=20);
translate([15,12.5+25])cylinder(r=3.3/2,h=10,$fn=20);
translate([15,12.5,base_thickness-3])cylinder(r=6.5/2,h=10,$fn=20);
translate([15,12.5+25,base_thickness-3])cylinder(r=6.5/2,h=10,$fn=20);
}

translate([0,-30])difference(){
translate([0,10])base();
translate([15,25])cylinder(r=3.3/2,h=10,$fn=20);
translate([15,25,base_thickness-3])cylinder(r=6.5/2,h=10,$fn=20);

}