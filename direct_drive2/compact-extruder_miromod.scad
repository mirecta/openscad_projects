// PRUSA iteration3
// Compact extruder
// GNU GPL v3
// Josef Průša <iam@josefprusa.cz> and contributors
// http://www.reprap.org/wiki/Prusa_Mendel
// http://prusamendel.org
// little mod by Chema
//mod by mirecta

dual_extruder = false;

with_vertical_carriage_holes = true;
sep_mount=30; //vertical_carriage screw space (24 or 30)
with_mountplate_holes = false; //set this to true for CatNozzle

//printed rods for the 608zz bearings?
PR608=false;

//filament width
filw=2.2; //it was 5.2??
filamentshift = -0.6;
m4_nut_height=2;
m4_nut_diameter=8.3;

// supported hotends: jhead, catnozzle double is work in progress...
// comment the line to disable
with_hotend_mount = "jhead";
//with_hotend_mount = "CatNozzle"; //for CatNozzle (Dual or single) you only need "with_mount_plate=true"

// supported motors: PG35L, 42BYG48HJ50
with_motor = "42BYG48HJ50";

//if(!dual_extruder && with_mountplate_holes) {
//	echo("can't use dual extruder with mountplate!");
//}
//else {

/*extruder(vertical_carriage=with_vertical_carriage_holes, mounting_holes=with_mountplate_holes, hotend=with_hotend_mount);*/
/*
if(with_motor == "PG35L") {
	for(i=dual_extruder ? [0,1] : [0]) mirror([i,0,0])
		translate([19+25+2+6, -9, 8+3]) rotate([0,180,0]) idler();
} else if(with_motor == "42BYG48HJ50") {
	for(i=dual_extruder ? [0,1] : [0]) mirror([i,0,0])
		translate([19+25+2, -9, 8+3]) rotate([0,180,0]) idler();
}*/
 
rotate([0,180,0]) idler();
//miro_hotend();
//tiltscrew();
// printed rods for the 608zz bearings.
if(PR608)
	for(i=[1,2,3])
		translate([0,i*12-6,0]) cylinder(r=8/2,h=14);
//}

///-

module motor() {
	
	if(with_motor == "PG35L") {
		difference() {
			union() {
			cylinder(h=42.8,r=35/2); // motor body
			// wings..
			difference() {
				hull() {
					intersection() {
						translate([-50/2, -35/2, 0]) cube([50,35/2,5]);
						cylinder(h=5,r=35/2);
					}
					translate([49/2-7.5/2,0,0]) cylinder(h=5,r=7.5/2);
					translate([-49/2+7.5/2,0,0]) cylinder(h=5,r=7.5/2);
				}
				translate([49/2-7.5/2,0,0]) cylinder(h=5,r=3.5/2);
				translate([-49/2+7.5/2,0,0]) cylinder(h=5,r=3.5/2);
			}
			}
			for(i=[0:2]) {
				rotate([0,0,120*i]) translate([0, -35/2+0.5, 23/2]) cube([8, 3, 23], center=true);
			}
		}

		rotate([0,0,15]) translate([0,50/2-7,42.8-13/2-3]) cube([16, 7, 13], center=true);

		translate([0,0,-4.6]) cylinder(h=4.6,r=10/2); // motor shaft
		translate([0,0,-4.6-8]) cylinder(h=8,r=4.8/2); // motor shaft
		
		// mini hyena: H=10mm, ID=5mm, OD=12.5mm
		#translate([0,0,-5]) rotate([180,0,0]) difference() {
			union() {
				cylinder(h=5.5,r=12.5/2);
				translate([0,0,5.5]) cylinder(h=2,r2=10.5/2, r1=12.5/2);
				translate([0,0,5.5+2]) cylinder(h=2, r2=12.5/2,r1=10.5/2);
				translate([0,0,9.5]) cylinder(h=0.5,r=12.5/2);
			}
			cylinder(h=10,r=5/2);
		}
		
	}
	else if(with_motor == "42BYG48HJ50") {

		cylinder(h=38,r=42/2);

		difference() {
			translate([-22,-22,0]) cube([44,44,1.2]);
			for(r=[0,90,180,270])
				rotate([0,0,r]) #translate([-36/2,-36/2, 0]) cylinder(h=1.2,r=3.4/2);
		}

		translate([0,(-44/2)+11.5,-14]) cylinder(r=13/2,h=14);
	}
	else {
		echo("I don't know this motor type");
	}
}


module nut(d,h,horizontal=true){
    cornerdiameter =  (d / 2) / cos (180 / 6);
    cylinder(h = h, r = cornerdiameter, $fn = 6);
    if(horizontal){
        for(i = [1:6]){
            rotate([0,0,60*i]) translate([-cornerdiameter-0.2,0,0]) rotate([0,0,-45]) cube([2,2,h]);
        }
    }
}

module bolt(length=10, d=3.3) {
	cylinder(r=d/2,h=length, $fn=20);
    
	//translate([0,0,length]) cylinder(r=d*1.5/2,h=3,$fn=20);
}
module miro_hotend() {
width=21;
translate([(1.5+11+3.5+2+1)-width/2+filamentshift,58])
difference(){
union(){
cube([width+12,8,20]);
}
translate([(width-10.5)/2,0,2.5])cube([10.5,4,20]);
 //m3nut for fan2 holder
 #translate([27,1,7]){
 translate([0,-1])cube([3,6+1+1.5,5.8]);
 translate([-4,3.5,5.8/2])rotate([0,90])cylinder(r=3.2/2,h=11,$fn=20);
}
}

% translate([(1.5+11+3.5+2+1+10)-width/2+filamentshift,58+8,11]) rotate([-90,0,0]){
cylinder(r=6/2,h=55,$fn=20);
translate([0,0,13])cylinder(r=25/2,h=25,$fn=20);
}
}

module jhead_mount() {
   top_d=16;
   top_h=5;
   groove_d=12.3;
   groove_h=5.6;
   translate([filamentshift-1,0]) 
   difference() {
	union() {
      translate([4,54-2,0]) cube([top_d+8 -filamentshift + 1+7 ,top_h+groove_h+2,14]);
      hull() {
        translate([2,54-5,14]) cube([top_d+12 -filamentshift + 1 ,top_h+groove_h+7,10]);
        translate([4,54-2,10]) cube([top_d+8  -filamentshift + 1,top_h+groove_h+2,14]);
      }
     }
	 translate([1.5+11+3.5,54,11]) rotate([-90,0,0]) cylinder(r=groove_d/2+0.5, h=top_h+groove_h+1);
	 translate([1.5+11+3.5,54,11]) rotate([-90,0,0]) cylinder(r=top_d/2+0.5, h=top_h);
      hull() {
	    translate([1.5+11+3.5,54,11+(groove_d/2)+1]) rotate([-90,0,0]) cylinder(r=(groove_d+4)/2, h=top_h+groove_h+10);
	    translate([1.5+11+3.5,54,11+15]) rotate([-90,0,0]) cylinder(r=(groove_d+4)/2, h=top_h+groove_h+1);
      }
      hull() {
	    translate([1.5+11+3.5,54,11+(groove_d/2)-1]) rotate([-90,0,0]) cylinder(r=(groove_d+4)/2+0.5, h=top_h);
	    translate([1.5+11+3.5,54,11+15]) rotate([-90,0,0]) cylinder(r=(groove_d+4)/2+0.5, h=top_h);
      }
      hull() {
	    translate([1.5+11+3.5,54+top_h+groove_h,11+(groove_d/2)-1]) rotate([-90,0,0]) cylinder(r=(groove_d+4)/2+0.5, h=top_h);
	    translate([1.5+11+3.5,54+top_h+groove_h,11+15]) rotate([-90,0,0]) cylinder(r=(groove_d+4)/2+0.5, h=top_h);
      }
	 //translate([0,54,12]) cube([33, 2, 20]);
     translate([40,61,18]) rotate([0,-90,0]) bolt(length=40, d=3.6);
     //fan 2 holder
 /*     translate([32,56,7]){
 translate([0,-1])cube([3,6+1+1.5,5.8]);
 translate([-4,3.5,5.8/2])rotate([0,90])cylinder(r=3.2/2,h=11,$fn=20);
}*/
   }
}

module extruder_42BYG48HJ50_body() {
 // Main body
 translate([-2+2,0,0]) cube([22+2,58-4,24]);
 translate([11-2+2+2,22+1+4-1,0]) {
  translate([11,13.5,12+1]) {
	cube([5,14,12-1.5]);
     translate([5,3.5,0]) cylinder(r=3.5, h=12-1.5);
  }
  translate([11,13,0]) {
	cube([5,8,12+1.5]);
     translate([5,4,0]) cylinder(r=4, h=12+1.5);
  }
 }
}

module extruder_42BYG48HJ50_holes() {
 translate([11+2,25-3+4,0]) {
  // Main shaft opening
  translate([-1,0,-1]) cylinder(r=7.5, h=26);
  // Lower motor mount hole
  translate([-8.5,18,-1]) cylinder(r=2, h=22);
  // Upper motor mount hole
  translate([-8.5,-18,-1]) cylinder(r=2, h=22);
  // Lower motor mount hole screw head
  translate([-8.5,18,3]) nut(5.8,10);
  // Upper motor mount hole screw head
  translate([-8.5,-18,3]) nut(5.8,10);
  // Idler bearing cutout
  translate([11+3,0,-4.5+10]) cylinder(r=12, h=24);

  // remove some plastic on the upper part.
  translate([11-2+2,13.5+1-1,0]) {
	cube([5,7,12+1]);
     translate([5,3.5,0]) cylinder(r=3.5, h=12+1);
  }
  translate([11+5-2+2,17+1-1,0]) bolt(12+1, 3.5);
   translate([11+5-2+2,17+1-1,12+1+0.3]) bolt(12+1, 3.5);
 }

 translate([11+2,25+4,0]) {
   hull() {
     translate([-15,15,25]) rotate([0,90,0]) cylinder(r=10/2,h=37);
     translate([-20,-30,25]) rotate([0,90,0]) cylinder(r=10/2,h=37);
   }
 }
 translate([11+2,25+4-10,-5]) {
   hull() {
     translate([-15,15,25]) rotate([0,90,0]) cylinder(r=10/2,h=35);
     translate([-20,-30,25]) rotate([0,90,0]) cylinder(r=10/2,h=35);
   }
 }

 // remove material
 hull() {
   translate([4,0,6]) cylinder(r=10/2, h=20);
   translate([4,31,6]) cylinder(r=10/2, h=20);
 }
 //translate([4,23,6]) cylinder(r=18/2, h=20);
 hull() for(x=[-1,10]) {
   translate([x,28,6]) cylinder(r=10/2, h=20);
   translate([x,44,6]) cylinder(r=10/2, h=20);
 }
 translate([5.5,-5,6]) cube([10,10,20]);

 // Filament path
 translate([1.5+11+3.5+2+1+filamentshift,65+4,11]) rotate([90,0,0]) cylinder(r=filw/2, h=70,$fn=20);
//translate([1.5+11+3.5+2+1+filamentshift,58+28,11]) rotate([90,0,0]) cylinder(r=6.2/2, h=30,$fn=20);
 // Hole for drive gear check
 translate([1.5+11+3.5-30+2,25-3+4,11]) rotate([90,0,90]) cylinder(r=4, h=70, $fn=20);

  translate([12+2,5+4,3]) tiltscrew();
//m3nut for fan holder
/* # translate([28,58,2.5]){
  translate([-5.8/2,-1,-1])cube([5.8,11,3]);
  translate([0,+4.5,-4])cylinder(r=3.2/2,h=5,$fn=15);
}*/
if (dual_extruder){
//m3nut for fan holder
 // translate([-5.8/2,58-8,3])cube([5.8,10,3]);
 // translate([0,58-3.5,0])cylinder(r=3.2/2,h=6,$fn=15);

}

}

module extruder_PG35L_body() {
 // Main body
 translate([-2+2,0,0]) cube([24+6,58-9,24]);

 *%translate([8,40,7]) rotate([0,-90,0]) bearing();

 translate([11-2+2+2+6, 22+1+4-1, 0]) {
  translate([11-1,13.5,12+1.5]) {
	cube([5,14,12-1.5]);
     translate([5+1,3.5,0]) cylinder(r=3.5, h=12-1.5);
  }
  translate([11,13,0]) {
	cube([5,8,12+1.5]);
     translate([5,4,0]) cylinder(r=4, h=12+1.5);
  }
 }
}

module extruder_PG35L_holes() {
 translate([11+2,25-3+4,0]) {
  // Main shaft opening
  translate([5.5,0,-1]) cylinder(r=7.5, h=26);

  // Lower motor mount hole
  translate([5.5,21+0.5,-10]) cylinder(r=2, h=34);
  // Lower motor mount hole screw head
  translate([5.5,21+0.5,3]) nut(6,22);

  // Upper motor mount hole
  translate([5.5,-21+0.5,-10]) cylinder(r=2, h=34-20);
  // Upper motor mount hole screw head
  translate([5.5,-21+0.5,1.5]) nut(6,4);

  // Idler bearing cutout
  translate([11+3+5,0,-4.5+10]) cylinder(r=12, h=24);

  // remove some plastic on the upper part.
  translate([11-2+2+6,13.5+1-1,0]) {
	cube([5,7,12+1]);
     translate([5,3.5,0]) cylinder(r=3.5, h=12+1);
  }
  translate([11+5-2+2+6,17+1-1,0]) bolt(25, 3.5);
 }

 translate([11+2,25+4,0]) {
   hull() {
     translate([-15,15,25]) rotate([0,90,0]) cylinder(r=10/2,h=35+6);
     translate([-15,-30,25]) rotate([0,90,0]) cylinder(r=10/2,h=35+6);
   }
 }
 translate([11+2,25+4-10,-4]) {
   hull() {
     translate([-15,15,25]) rotate([0,90,0]) cylinder(r=10/2,h=35+6);
     translate([-15,-30,25]) rotate([0,90,0]) cylinder(r=10/2,h=35+6);
   }
 }

 // remove material
 difference() {
 hull() for(x=[0,9]) {
   translate([x,0,0]) cylinder(r=10/2, h=20);
   translate([x,38+((!dual_extruder && with_motor == "PG35L") ? 6 : 0),0]) cylinder(r=10/2, h=20);
 }
  translate([5.5,0,-1]+[11+2,25-3+4,0]) cylinder(r=11, h=26);
 }
 difference() {
 hull() for(x=[-2,10+5]) {
   translate([x,21,6]) cylinder(r=10/2, h=20);
   translate([x,42,6]) cylinder(r=10/2, h=20);
 }
 translate([5.5,0,-1]+[11+2,25-3+4,0]) cylinder(r=11, h=17);
 }
 translate([5.5+5.8,-5,6]) cube([10,10,20]);

 // Filament path
 translate([25,65+4,11+1.5]) rotate([90,0,0]) cylinder(r=filw/2, h=70);
 // Hole for drive gear check
 *translate([1.5+11+3.5-30+2,25-3+4,11]) rotate([90,0,90]) cylinder(r=4, h=70, $fn=20);

  translate([12+2+6,5+4,3+1]) tiltscrew();
}

module extruder_mount(vertical_carriage=false, mounting_holes=true) {
 // Extruder plate mount
 if(mounting_holes) {
   if(dual_extruder){
     translate([-16+2-(with_motor == "PG35L"?44:38),49+4,0]) cube([65+(with_motor == "PG35L"?51:39),5,24]);
   } else {
	if(with_motor == "PG35L"){
		translate([-16+2+5,49+4,0]) cube([68,5,24]);
	} else {
		translate([-16+2,49+4,0]) cube([65,5,24]);
	}
   }
 } else {
   //translate([14+2,49+4,0]) cube([10,5,24]);
 }
 // Carriage mount cylinders
 if(vertical_carriage) {
	carriage_mount_cylinders();
  }
}

module carriage_mount_cylinders() {
 if(with_motor == "PG35L") {
  translate([11+2+(dual_extruder ? 0 : 5+3),25+4,0])
    //hull() for(t=dual_extruder?[16+5,-42-5]:[16,-8])
	hull() for(t=dual_extruder?[16+5,-42-5]:[sep_mount/3*2,-sep_mount/3-2])
      translate([t,24,0]) cylinder(r=5, h=24);
 } else {
  translate([11+2,25+4,0])
    hull() for(t=dual_extruder?[16,-42]:[sep_mount/3*2+3,-sep_mount/3-2+3])
      translate([t,24,0]) translate([-9/2,-5])cube([9,10,24]);//cylinder(r=5, h=24);
 }
}

module extruder_mount_holes(vertical_carriage=false, mounting_holes=true) {
 translate([dual_extruder?0:11+4+2+(with_motor == "PG35L"?5:0),25+4,0]){
 if(vertical_carriage) {
  for(i=[-1,1]){
  // Carriage mount right and left screw head holes
  translate([i*sep_mount/2+(dual_extruder?0:3),24,-3]) cylinder(r=3.5, h=23-(sep_mount==24?0:13));
  // Carriage mount left and right screw holes
  translate([i*sep_mount/2+(dual_extruder?0:3),24,20.5-(sep_mount==24?0:13)]) cylinder(r=2, h=23);
 }
 }
 }
 if(mounting_holes) {
//   %translate([1.5+11+3.5++25+2+2,69,11]) rotate([90,0,0]) cylinder(r=4.3/2, h=50);
//   // Left extruder plate mounting hole
//   #translate([1.5+11+3.5+25+2,65+4,11]) rotate([90,0,0]) cylinder(r=4.3/2, h=20);
//   // Right extruder plate mounting hole
//   %translate([1.5+11+3.5-25+2+2,65+4,11]) rotate([90,0,0]) cylinder(r=4.3/2, h=20);
   translate([dual_extruder||(with_motor == "PG35L")?0:-5,69,11+(with_motor == "PG35L"?1.7:0)]) 
    rotate([90,0,0]) cylinder(r=4.3/2, h=20);
	translate([dual_extruder||(with_motor == "PG35L")?0:-5,69-16+m4_nut_height,11+(with_motor == "PG35L"?1.7:0)]) 
	 rotate([90,0,0]) cylinder(r=m4_nut_diameter/2, h=10,$fn=6);
   // Left extruder plate mounting hole
   translate([25+(with_motor == "PG35L"?25:20),69,11+(with_motor == "PG35L"?1.7:0)]) 
    rotate([90,0,0]) cylinder(r=4.3/2, h=20);
	translate([25+(with_motor == "PG35L"?25:20),69-16+m4_nut_height,11+(with_motor == "PG35L"?1.7:0)]) 
	 rotate([90,0,0]) cylinder(r=m4_nut_diameter/2, h=10,$fn=6);
   // Right extruder plate mounting hole
   translate([-25-(with_motor == "PG35L"?25:20),69,11+(with_motor == "PG35L"?1.7:0)]) 
    rotate([90,0,0]) cylinder(r=4.3/2, h=20);
	translate([-25-(with_motor == "PG35L"?25:20),69-16+m4_nut_height,11+(with_motor == "PG35L"?1.7:0)]) 
	 rotate([90,0,0]) cylinder(r=m4_nut_diameter/2, h=20,$fn=6);

  }
}

module extruder_hotend(hotend=undef) {
 if(hotend == "jhead") {
   translate([2+2+(with_motor == "PG35L" ? 5 : 0),4,0]) jhead_mount();
 }else if(hotend == "miro") {
   miro_hotend();
 }
}

module extruder_full(vertical_carriage=false, mounting_holes=true, hotend=undef) {
  if(with_motor == "PG35L") {
     extruder_PG35L_body();
     translate([-2.5+25-4,27-3+2,0]) %rotate([180,0,90]) motor();
     if(dual_extruder) mirror([1,0,0]) extruder_PG35L_body();
     if(dual_extruder) mirror([1,0,0]) translate([-2.5+25-4,27-3+2,0]) %rotate([180,0,90]) motor();
  } else if(with_motor == "42BYG48HJ50") {
	extruder_42BYG48HJ50_body();
  	translate([-2.5+25,27-3+2,0]) %rotate([180,0,90]) motor();
     if(dual_extruder) mirror([1,0,0]) extruder_42BYG48HJ50_body();
  	if(dual_extruder) mirror([1,0,0]) translate([-2.5+25,27-3+2,0]) %rotate([180,0,90]) motor();
  }
  extruder_mount(vertical_carriage, mounting_holes);
  extruder_hotend(hotend);
  if(dual_extruder) mirror([1,0,0]) extruder_hotend(hotend);
}

module extruder_full_holes(vertical_carriage=false, mounting_holes=true){
  if(with_motor == "PG35L") {
	extruder_PG35L_holes();
    if(dual_extruder) mirror([1,0,0]) extruder_PG35L_holes();
  } else if(with_motor == "42BYG48HJ50") {
	extruder_42BYG48HJ50_holes();
    if(dual_extruder) mirror([1,0,0]) extruder_42BYG48HJ50_holes();
  }
  extruder_mount_holes(vertical_carriage, mounting_holes);
}

module tiltscrew() {
    for(r=[0:5:30]) rotate([0,0,-r])
      translate([-2,-15,0]) cube([3.4,20,7.4]);
    for(r=[0:2:30]) rotate([0,0,-r])
      translate([-10,0,7.4/2]) rotate([0,90,0]) cylinder(r=5/2,h=40,$fn=20);
}

module bearing() {
  difference() {
	rotate([0,90,0]) cylinder(r=22/2,h=8);
	rotate([0,90,0]) cylinder(r=8/2,h=8);
  }
}

module extruder_idler_base(bearing_indent){
difference(){ 
union(){
 translate([0,10-4,3-0.5]) cube([19.5,34+4,8.5]);
 translate([0,25+5,6.1-bearing_indent]) rotate([0,90,0]) cylinder(r=16/2, h=19.5);
}
translate([-5,10,3-0.5+8.5])cube([80,80,20]);
}

/* intersection() {
   translate([0,8,-(8)]) cube([19.5,36,8+3]);
   translate([0,25+5,6.1-bearing_indent]) #rotate([0,90,0]) cylinder(r=16/2, h=19.5);
 }*/
 %translate([6,30,6]) bearing();
  translate([0,43,11]) rotate([0,90,0]) {
	translate([0,0,6]) cube([8.4,5,10.5-6]);
     translate([8.4/2,5,6]) cylinder(r=8.4/2, h=10.5-6);
  }
}

module extruder_idler_holes(bearing_indent){
 translate([10,25+5,0]){
  // Main cutout
  difference() {
    cube([10,23,25], center= true);
    translate([3.7,0,4.1+2-bearing_indent]) rotate([0,90,0]) cylinder(r1=6, r2=8, h=1.3);
    translate([-5,0,4.1+2-bearing_indent]) rotate([0,90,0]) cylinder(r1=8, r2=6, h=1.3);
  }
  // Idler shaft
  translate([-8,0,4.1+2-bearing_indent]) rotate([0,90,0]) cylinder(r=4.1, h=16);
  hull() {
    translate([-8,0,4.1+2+6-bearing_indent]) rotate([0,90,0]) cylinder(r=6, h=16);
    translate([-8,0,4.1+2+6-bearing_indent]) rotate([0,90,0]) cylinder(r=6, h=16);
  }
 }

  hull() {
    translate([5,13,-1]) cylinder(r=5.5/2, h=15);
    translate([5,0,-1]) cylinder(r=5.5/2, h=15);
  }
  translate([0,48,11-8.4/2]) rotate([0,90,0]) bolt(25, 4);
  *translate([0,48,11-8.4/2]) rotate([0,90,0]) nut(6.5, 5);

  translate ([-1,0])hull() {
  cube([30,16+2,4]);
  translate([0,2.5+2,-4]) cube([30,16,4]);
  }
  translate([5,0,0]) cube([10,20,4]);
}

// Idler final part
module idler(bearing_indent=-1){
 difference(){
  extruder_idler_base(bearing_indent);
  extruder_idler_holes(bearing_indent);
 }
}

// Extruder final part
module extruder(vertical_carriage=true, mounting_holes=false, hotend=undef){
 translate([0,0,0]) difference(){
  extruder_full(vertical_carriage=vertical_carriage, mounting_holes=mounting_holes, hotend=hotend);
  extruder_full_holes(vertical_carriage=vertical_carriage, mounting_holes=mounting_holes, hotend=hotend);
 }
}

//translate([28-5,58,-3])color([0,0.8,0])fan_duct_holder();

module fan_duct_holder(){
   difference(){
    union(){
    cube([10,13.3,3]);
    translate([0,11.3-3,+3])cube([10,5,3]);   
    translate([-2,0,-24])cube([3,13.3,27]);
    translate([-13-3,0,-24])cube([13+3,13.5,6]);
    translate([-13-3,0,-24-3])cube([3,13.5,3]);
   }
    translate([5,+4.5,-80+4])cylinder(r=3.2/2,h=80,$fn=15);
    translate([-5.5,18-5-4,-31])cylinder(r=3.5/2,h=20,$fn=20);
   translate([-5.5,18-5-4,-20.5])cylinder(r=6.03/2,h=3,$fn=6); 
   
   }
}



//translate([(1.5+11+3.5+2+0.5+10)-20/2+filamentshift,76,-30])rotate([0,0,180])fan_duct1();


module fan_duct1(){

module duct(){
translate([-8,5])
difference(){
cube([16,8,3]);
translate([8,4,-1])cylinder(r=3.5/2,h=10,$fn=20);
}
difference(){
translate([-20,-40,0])cube([40,45,3]);
translate([-16,-4,-1])cylinder(r=3.5/2,h=6,$fn=20);
translate([16,-4,-1])cylinder(r=3.5/2,h=6,$fn=20);
translate([-16,-36,-1])cylinder(r=3.5/2,h=6,$fn=20);
translate([16,-36,-1])cylinder(r=3.5/2,h=6,$fn=20);
translate([0,-20,-1])cylinder(r=37/2,h=6,$fn=80);

}
difference(){
difference(){
union(){
hull(){
translate([0,-20,0])cylinder(r=37/2,h=8,$fn=80);
translate([-15,-30,17+17])cube([30,30,10]);
}
hull(){
translate([-15/2,-40,0])cube([15,30,1]);
translate([-20/2,-40,17+16])cube([20,30,1]);
}
}
hull(){
translate([0,-20,0])cylinder(r=37/2-1.5,h=8,$fn=80);
translate([-27/2,-27-1.5,17+17])cube([27,27,10]);
}
}
hull(){
translate([0,5,38])rotate([90,0,0])cylinder(r=27/2,h=39.5,$fn=50);
translate([0,5,35+10])rotate([90,0,0])cylinder(r=27/2,h=39.5,$fn=50);
}
}
}

difference(){
duct();
hull(){
translate([-(20-3)/2,-40+1.5,17+16])cube([20-3,30,1]);
translate([-(15-3)/2,-40+1.5,0])cube([15-3,30,1]);
}
translate([0,-35,17+23])rotate([90,0])cylinder(r=20/2,h=10,$fn=30);
}
}