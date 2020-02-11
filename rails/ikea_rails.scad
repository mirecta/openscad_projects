gheight=12.;
gwidth=39.;

module bank_profile(height=gheight, width=gwidth) {
	polygon( points=[[-width/2,0], [width/2,0], [width/2,height], [-width/2,height]], convexity = -1);
}

module rail_profile_negative(height=gheight, width=gwidth) {
	polygon( points= [
        [-16,-1],
        [-16,0], [-15.5,0.5], 
        [-15.5,2.5], [-15,3], 
		[-10,3], [-9.5,2.5], 
		[-9.5,0.5], [-9,0],
		[-9,-1],

		[9,-1],
		[9,0], [9.5,0.5], 
		[9.5,2.5], [10,3], 
		[15,3], [15.5,2.5], 
		[15.5,0.5], [16,0],
		[16,-1],

        [16,height+1],
        [16,height], [15.5,height-0.5], 
		[15.5,height-2.5], [15,height-3], 
		[10,height-3], [9.5,height-2.5], 
		[9.5,height-0.5], [9,height],
		[9,height+1],
 
        [-9,height+1],
		[-9,height], [-9.5,height-0.5], 
		[-9.5,height-2.5], [-10,height-3], 
		[-15,height-3], [-15.5,height-2.5],         
		[-15.5,height-0.5], [-16,height],
		[-16,height+1] 
		],

		paths=[
          [0,1,2,3,4,5,6,7,8,9], 
          [10,11,12,13,14,15,16,17,18,19],
          [20,21,22,23,24,25,26,27,28,29],
          [30,31,32,33,34,35,36,37,38,39]
	    ]);
}

module straight_bank_raw(len=214, height=gheight, width=gwidth) {
	linear_extrude(height=len) {
		bank_profile(height=height, width=width);
	}
}

module straight_rail_negative(len=214, height=gheight, width=gwidth) {
	linear_extrude(height=len) {
		rail_profile_negative(height=height, width=width);
	}
}

module straight_rail_raw(len=214, height=gheight, width=gwidth) {
	    		rotate([90,0,0]) {
                 difference() {
                 	straight_bank_raw(len=len, height=height, width=width);
					straight_rail_negative(len=len, height=height, width=width);
				}
			}
}

module straight_rail(len=214, height=gheight, width=gwidth) {
    translate([len,0,0]) rotate([0,0,-90]) union() {
    		difference() {

			straight_rail_raw(len=len, height=height, width=width);
			translate([0,-len-0.05*17,-0.05*height]) scale([1.1,1.1,1.1]) rail_lock(height=height);
    		}
    		rail_lock(height=height);
	}
}

module straight_rail_mm(len=214, height=gheight, width=gwidth) {
	translate([len,0,0]) rotate([0,0,-90]) {
		rail_lock(height=height);
		straight_rail_raw(len=len, height=height, width=width);
		rotate([0,0,180]) translate([0,len,0]) rail_lock(height=height);
	}
}

module straight_rail_ff(len=214, height=gheight, width=gwidth) {
    translate([len,0,0]) rotate([0,0,-90]) difference() {
		difference() {
			straight_rail_raw(len=len, height=height, width=width);
			translate([0,-len-0.05*17,0]) scale([1.1,1.1,1.1]) rail_lock(height=height);
		};
		rotate([0,0,180]) translate([0,-0.05*17,0]) scale([1.1,1.1,1.1]) rail_lock(height=height);
	}
}

module curved_bank_raw(radius=200, angle=360/8, height=gheight, width=gwidth) {
	difference() {
		rotate_extrude() 
			translate([-radius,0,0]) rotate(a=[-0,0,0]) 
			bank_profile(height=height, width=width);
		
		angle_cutting_block(height=height+2, radius=radius+width, angle=angle);		
	}
}

module curved_rail_negative(radius=200, angle=360/8, height=gheight, width=gwidth) {
	difference() {
		rotate_extrude() 
			translate([-radius,0,0]) rotate(a=[0,0,0]) 
			 rail_profile_negative(height=height, width=width);
		
		translate([0,0,-1])
		angle_cutting_block(height=height+2, radius=radius+width, angle=angle);
	}
}

module curved_rail_raw(radius=200, angle=360/8, height=gheight, width=gwidth) {
	difference() {
		curved_bank_raw(radius=radius, angle=angle, height=height, width=width);
		curved_rail_negative(radius=radius, angle=angle, height=height, width=width);
	}
}

module curved_rail(radius=200, angle=360/8, height=gheight, width=gwidth) {
    translate([0,-radius,0]) union() { 
		difference() {
			curved_rail_raw(radius=radius, angle=angle, height=height, width=width);
        		translate([-0.05*17,radius,0]) rotate([0,0,-90]) scale([1.1,1.1,1.1]) rail_lock(height=height);
		}
    		rotate([0,0,-angle]) translate([0,radius,0]) rotate([0,0,-90]) rail_lock(height=height);
	}
}

module curved_rail_mm(radius=200, angle=360/8, height=gheight, width=gwidth) {
	translate([0,-radius,0]) union() {
		rotate([0,0,-angle]) translate([0,radius,0]) rotate([0,0,-90]) rail_lock(height=height);
		curved_rail_raw(radius=radius, angle=angle, height=height, width=width);
		translate([0,radius,0]) rotate([0,0,90]) rail_lock(height=height);
	}
}

module curved_rail_ff(radius=200, angle=360/8, height=gheight, width=gwidth) {
	translate([0,-radius,0]) difference() {
		difference() {
			curved_rail_raw(radius=radius, angle=angle, height=height, width=width);
			translate([-0.05*17,radius,0]) rotate([0,0,-90]) scale([1.1,1.1,1.1]) rail_lock(height=height);
		}
		rotate([0,0,-angle]) translate([0.05*17,radius,0]) rotate([0,0,90]) scale([1.1,1.1,1.1]) rail_lock(height=height);
	}
}

module rail_lock(height=gheight) {
	translate([-3,-1,0]) cube([6, 8, height]);
	translate([0,11,0]) cylinder(h=height, d=11);
}

module male_male_rail_lock(height=gheight) {
	rotate([0,0,90]) union() {
		rotate([0,0,180]) rail_lock(height=height);
		rail_lock(height=height);
	}
}

module angle_cutting_block(height, radius ,angle) {
    linear_extrude(height=height) {
    		if (sin(angle) > 0) {
			polygon(points = [ [0, radius], [0, 0],
				[sin(angle)*radius, cos(angle)*radius],
        			[radius, cos(angle)*radius],
        			[radius, -radius],
        			[-radius, -radius],
        			[-radius, radius] 
			]);
    		} else {
			polygon(points = [ [0,radius], [0,0],
				[sin(angle)*radius, cos(angle)*radius],
				[-radius, cos(angle)*radius],
				[-radius, radius]
			]);
    		}
	}
}

module shunt_raw(len=214, height=gheight, width=gwidth, radius=200, angle=360/8) {
    difference() {
	    union() {
            rotate([90,0,90]) 
            straight_bank_raw(len=len, height=height, width=width);
            translate([0,-radius,0]) 
            curved_bank_raw(radius=radius, angle=angle, height=height, width=width);
	    };
        union() {
            rotate([90,0,90]) 
            straight_rail_negative(len=len, height=height, width=width);
            translate([0,-radius,0]) 
            curved_rail_negative(radius=radius, angle=angle, height=height, width=width);
        }
    }	
}

module shunt_mff(len=151, height=gheight, width=gwidth, radius=200, angle=360/8) {
	difference() {
        union() {
    		    difference() {
                shunt_raw(len=len, height=height, width=width, radius=radius, angle=angle);
			    translate([len-0.05*17,0,-0.05*height]) scale([1.1,1.1,1.1]) 
                 rotate([0,0,90]) rail_lock(height=height);
    		    }
    		    rotate([0,0,90]) rail_lock(height=height);
	    };
	    translate([0,-radius,0]) rotate([0,0,-angle]) 
        translate([0,radius,0]) rotate([0,0,90]) 
        scale([1.1,1.1,1.1]) rail_lock(height=height);	
    }
}

module shunt_fmm(len=151, height=gheight, width=gwidth, radius=200, angle=360/8) {
	union() {
        difference() {
    		    union() {
                shunt_raw(len=len, height=height, width=width, radius=radius, angle=angle);
			    translate([len,0,0]) 
                 rotate([0,0,-90]) rail_lock(height=height);
    		    };
    		    translate([0.05*17,0,0]) rotate([0,0,-90]) scale([1.1,1.1,1.1]) 
            rail_lock(height=height);
	    };
        translate([0,-radius,0]) rotate([0,0,-angle]) 
        translate([0,radius,0]) rotate([0,0,-90]) 
        rail_lock(height=height);	
    }
}

module shunt_3way_raw(len=151, height=gheight, width=gwidth, radius=200, angle=360/8) {
    difference() {
	    union() {
            rotate([90,0,90]) 
            straight_bank_raw(len=len, height=height, width=width);
            translate([0,-radius,0]) 
            curved_bank_raw(radius=radius, angle=angle, height=height, width=width);
            rotate([180,0,0]) translate([0,-radius,-height]) 
            curved_bank_raw(radius=radius, angle=angle, height=height, width=width);

	    };
        union() {
            rotate([90,0,90]) 
            straight_rail_negative(len=len, height=height, width=width);
            translate([0,-radius,0]) 
            curved_rail_negative(radius=radius, angle=angle, height=height, width=width);
            rotate([180,0,0]) translate([0,-radius,-height]) 
            curved_rail_negative(radius=radius, angle=angle, height=height, width=width);
        }
    }	
}

module shunt_3way_fmmm(len=151, height=gheight, width=gwidth, radius=200, angle=360/8) {
    difference() {
	    shunt_3way_raw(len=len, height=height, width=width, radius=radius, angle=angle);
        translate([-0.05*17,0,-0.5]) rotate([0,0,-90]) scale([1.1,1.1,1.1]) 
        rail_lock(height=height);
    }
    translate([len,0,0]) rotate([0,0,-90]) rail_lock(height=height);
    translate([0,-radius,0]) rotate([0,0,-angle]) translate([0,radius,0]) rotate([0,0,-90]) rail_lock(height=height);
    translate([0,radius,0]) rotate([0,0,angle]) translate([0,-radius,0]) rotate([0,0,-90]) rail_lock(height=height);
}

module shunt_3way_mfff(len=151, height=gheight, width=gwidth, radius=200, angle=360/8) {
    difference() {
        union() {
	        shunt_3way_raw(len=len, height=height, width=width, radius=radius, angle=angle);
            rotate([0,0,90]) 
            rail_lock(height=height);
        };
        union() {
            translate([len+0.05*17,0,-0.5]) rotate([0,0,90]) scale([1.1,1.1,1.1]) 
            rail_lock(height=height);
        
            translate([0,-radius,0]) rotate([0,0,-angle]) 
            translate([0.05*17,radius,-0.5]) rotate([0,0,90]) 
            scale([1.1,1.1,1.1]) rail_lock(height=height);
    
            translate([0,radius,0]) rotate([0,0,angle]) 
            translate([0.05*17,-radius,-0.5]) rotate([0,0,90]) 
            scale([1.1,1.1,1.1]) rail_lock(height=height);
	    }
    }
}

module shunt_t_raw(height=gheight, width=gwidth, radius=100) {
	angle=90;
    len=2*radius;
	
    difference() {
	    union() {
            rotate([90,0,90]) 
            straight_bank_raw(len=len, height=height, width=width);
            translate([0,-radius,0]) 
            curved_bank_raw(radius=radius, angle=angle, height=height, width=width);
            rotate([0,180,0]) translate([-2*radius,-radius,-height]) 
            curved_bank_raw(radius=radius, angle=angle, height=height, width=width);

	    };

        union() {
            rotate([90,0,90]) 
            straight_rail_negative(len=len, height=height, width=width);
            translate([0,-radius,0]) 
            curved_rail_negative(radius=radius, angle=angle, height=height, width=width);
            rotate([0,180,0]) translate([-2*radius,-radius,-height]) 
            curved_rail_negative(radius=radius, angle=angle, height=height, width=width);
        };
    }		
}

module shunt_t_mfm(height=gheight, width=gwidth, radius=100) {
    difference() {
        union() {
            shunt_t_raw(height=height, width=width, radius=radius);
            //rotate([0,0,90]) rail_lock(height=height);
            //translate([0,-radius,0]) rotate([0,0,-90]) translate([0,radius,0]) rotate([0,0,-90]) rail_lock(height=height);
        };
        translate([2*radius+0.05*17,0,-0.5]) rotate([0,0,90]) 
        scale([1.1,1.1,1.1]) rail_lock(height=height);
        rotate([0,0,-90]) 
        scale([1.1,1.1,1.1]) rail_lock(height=height);
        translate([0,-radius,0]) rotate([0,0,-90]) 
        translate([0,radius,0]) rotate([0,0,90]) 
        scale([1.1,1.1,1.1]) rail_lock(height=height);
    }
}


$fn=80;
 //rotate([0,0,-90]) shunt_t_mfm();
male_male_rail_lock();
// Standard set of rails I found home
//translate([-30,250,12]) rotate([0,180,0]) shunt_3way_fmmm();
//translate([30,250,0]) shunt_3way_mfff();
/*translate([0,150,0]) straight_rail(len=52);
translate([0,100,0]) straight_rail(len=60);
translate([0,50,0]) straight_rail(len=151);
straight_rail(len=214);
translate([0,-50,0]) curved_rail(radius=200, angle=360/8);
translate([0,-100,0]) curved_rail(radius=225/2, angle=360/9);
translate([0,-150,0]) curved_rail(radius=100, angle=360/8);
translate([30,-250,0]) shunt_mff($fn=80);
translate([-30,-250,12]) rotate([0,180,0]) shunt_fmm();
translate([0,-350,0]) male_male_rail_lock();

translate([-300,100,0]) rotate([0,0,-90]) shunt_t_mfm();

//Male-male versions
translate([-250,0,0]) {
translate([0,150,0]) straight_rail_mm(len=52);
translate([0,100,0]) straight_rail_mm(len=60);
translate([0,50,0]) straight_rail_mm(len=151);
straight_rail_mm(len=214);
translate([0,-50,0]) curved_rail_mm(radius=200, angle=360/8);
translate([0,-100,0]) curved_rail_mm(radius=225/2, angle=360/9);
translate([0,-150,0]) curved_rail_mm(radius=100, angle=360/8);
}


//Female-female versions
translate([250,0,0]) {
translate([0,150,0]) straight_rail_ff(len=52);
translate([0,100,0]) straight_rail_ff(len=60);
translate([0,50,0]) straight_rail_ff(len=151);
straight_rail_ff(len=214);
translate([0,-50,0]) curved_rail_ff(radius=200, angle=360/8);
translate([0,-100,0]) curved_rail_ff(radius=225/2, angle=360/9);
translate([0,-150,0])
    curved_rail_ff(radius=100, angle=360/8);
}

*/



