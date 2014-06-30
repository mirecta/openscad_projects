// 79.5 
use <../lib/write/Write.scad>

translate([18,0,0]) 
  difference(){
  difference(){
     union(){
           
           
			difference(){
           union(){
           cylinder(h=21, r=18./2, $fn=70);
           cylinder(h=10, r=25./2, $fn=70);
          } 
          translate([-13,0,7.5]) rotate([0,90,0]) cylinder(h=26, r=1.5/2, $fn=30);
         }

			translate([0,0,2]) cylinder(h=3, r1=35./2,r2=25./2, $fn=70);
         cylinder(h=2, r=35./2, $fn=70);
	  }
	translate([0,0,19+2.5-13])difference(){
   cylinder(h=13, r=6.2/2,$fn=70);
      translate([2.5,-3,0]) cube(size=[3,6,13]);
   } 
} 
 union(){
    translate([0,0,18]) rotate([0,90,0])cylinder(h=15, r=3./2, $fn=70);
     translate([3.5,-5.5/2,14]) cube(size=[2.4,5.5,8]);
 }  

}

translate([-18,0,0]) difference(){
   union(){
   translate([0,0,2]) cylinder(h=3, r1=35./2,r2=25./2, $fn=70);
   cylinder(h=2, r=35./2, $fn=70);
}
   translate([0,0,-0.2])cylinder(h=6, r=18./2, $fn=70);
}




