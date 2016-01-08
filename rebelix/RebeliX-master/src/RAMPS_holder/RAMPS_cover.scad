sirka = 107;
delka = 67;
rohy_prumer = 5;
tloustka = 2;
tloustka_steny = 3;

include <../inc/honeycomb.scad>

module obvod(){
  difference(){
	difference(){
	  hull(){
		translate([rohy_prumer/2,rohy_prumer/2,0]) cylinder(r=rohy_prumer/2,h=tloustka,$fn=32);
		translate([sirka-rohy_prumer/2,rohy_prumer/2,0]) cylinder(r=rohy_prumer/2,h=tloustka,$fn=32);
		translate([sirka-rohy_prumer/2,delka-rohy_prumer/2,0]) cylinder(r=rohy_prumer/2,h=tloustka,$fn=32);
		translate([rohy_prumer/2,delka-rohy_prumer/2,0]) cylinder(r=rohy_prumer/2,h=tloustka,$fn=32);
	  }
	// Vyrez pro konektory LCD
	translate([0,delka/2,tloustka/2]) cube([21-2*tloustka_steny,delka-2*5-2*tloustka_steny,tloustka+1],center=true);
	}
	difference(){
	  translate([tloustka_steny,tloustka_steny,-0.1]) cube([sirka-2*tloustka_steny,delka-2*tloustka_steny,tloustka+1]);
	  translate([0,delka/2,tloustka/2]) cube([21,delka,tloustka],center=true);
	}
  }
  // Otvory pro srouby
  translate([3.5,3.5,0]) cylinder(r=3.5,h=tloustka,$fn=16);
  translate([3.5,delka-3.5,0]) cylinder(r=3.5,h=tloustka,$fn=16);  
}

module mrizka(){
  intersection(){
    union(){
      // Honeycomb(length, width, height, cell_size, wall_thickness);
      translate([10.5,0,0]) honeycomb(sirka - 10.5, delka, tloustka, 8, 1.2);
	  // Pole pro text
	  translate([10.5,delka/2 - 10,0]) cube([sirka-10.5,20,tloustka]);
	}
	union(){
	  difference(){
	    hull(){
		  translate([rohy_prumer/2,rohy_prumer/2,0]) cylinder(r=rohy_prumer/2,h=tloustka,$fn=32);
		  translate([sirka-rohy_prumer/2,rohy_prumer/2,0]) cylinder(r=rohy_prumer/2,h=tloustka,$fn=32);
		  translate([sirka-rohy_prumer/2,delka-rohy_prumer/2,0]) cylinder(r=rohy_prumer/2,h=tloustka,$fn=32);
		  translate([rohy_prumer/2,delka-rohy_prumer/2,0]) cylinder(r=rohy_prumer/2,h=tloustka,$fn=32);
	    }
	  }
    }
  }
}

module otvory(){
   translate([3.5,3.5,-0.1]) cylinder(r=1.6,h=tloustka+1,$fn=16);
   translate([3.5,delka-3.5,-0.1]) cylinder(r=1.6,h=tloustka+1,$fn=16); 
   // Text
   translate([14,delka/2 - 15/2 ,-0.1]) rotate([0,0,-90]) import("RebeliX_text_3mm.stl", convexity=3);   
}

difference(){
  union(){
	obvod();
	mrizka();
  }	
  otvory();

  }
  // "Prichytky" pismen
  translate([22.6,delka/2 - 15/2 + 5,0]) cube([1.2,10,1]); 
  translate([37.3,delka/2 - 15/2 + 5,0]) cube([1.2,7,1]); 
  translate([49.3,delka/2 - 15/2,0]) cube([1.2,15,1]);
  translate([61,delka/2 - 15/2 + 5,0]) cube([1.2,7,1]);	  




