// RebeliX
//
// nozzle mount
// GNU GPL v3
// Martin Neruda
// http://www.reprap4u.cz

mount_height =8;
mount_width = 25;
mount_length = 38;
mount_jhead=5;

epsilon = 0.01;

difference(){
	union(){
	  cube([mount_length,mount_width,mount_height],center=true);
	}		
		
	translate([0,0,mount_jhead]) cylinder(r=8.5,h=mount_height,$fn=30,center=true);
	translate([0,-mount_width/2,mount_jhead]) cube([17,mount_width,mount_height],center=true);
	
	translate([0,0,-mount_height/2 - epsilon]) cylinder(r=6.1,h=mount_height,$fn=30);
	translate([0,-mount_width/2,-epsilon]) cube([12.2,mount_width,mount_height],center=true);
	
	// Otvory pro prisroubovani
	translate([-13,0,0])
        hull(){ 
            cylinder(r=1.6,h=mount_height+1,$fn=30,center=true);
            translate([0,-mount_width/2])cylinder(r=1.6,h=mount_height+1,$fn=30,center=true);
        }
    translate([13,0,0])
        hull(){ 
            cylinder(r=1.6,h=mount_height+1,$fn=30,center=true);
            translate([0,-mount_width/2])cylinder(r=1.6,h=mount_height+1,$fn=30,center=true);
        }
	
	
	
	
	
	translate([-13,0,-mount_height/2 + 4]) 
       hull(){
              cylinder(r=7/2,h=mount_height,$fn=30);
              translate([0,-mount_width/2])cylinder(r=7/2,h=mount_height,$fn=30);
       }
	translate([13,0,-mount_height/2 + 4]) 
       hull(){
              cylinder(r=7/2,h=mount_height,$fn=30);
              translate([0,-mount_width/2])cylinder(r=7/2,h=mount_height,$fn=30);
       }
	
	
	// Seriznute rohy
	translate([-mount_length/2,mount_width/2,0]) rotate([0,0,135]) cube([5,5,mount_height + 1],center=true);
	//translate([-mount_length/2,-mount_width/2,0]) rotate([0,0,-45]) cube([5,5,mount_height + 1],center=true);
	//translate([mount_length/2,-mount_width/2,0]) rotate([0,0,45]) cube([5,5,mount_height + 1],center=true);
	translate([mount_length/2,mount_width/2,0]) rotate([0,0,135]) cube([5,5,mount_height + 1],center=true);
    //final cut
       
    translate([0,-mount_width+8.5])cube([mount_length,mount_width,mount_height],center=true);
}	