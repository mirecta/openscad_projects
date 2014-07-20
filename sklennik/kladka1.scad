// 79.5 
use <../lib/write/Write.scad>

translate([18,0,0]) 
  difference(){
  difference(){
     union(){
           
           
			difference(){
           union(){
           //base
           cylinder(h=21+7, r=18./2, $fn=70);
           cylinder(h=7+1, r=25./2, $fn=70);
          } 
         //rope hole 
         translate([-13,0,6]) rotate([0,90,0]) cylinder(h=26, r=1.5/2, $fn=30);
         translate([-13,0,16]) rotate([0,90,0]) cylinder(h=26, r=1.5/2, $fn=30);
         }
         //base cone
			translate([0,0,2]) cylinder(h=2, r1=35./2,r2=25./2, $fn=70);
         cylinder(h=2, r=35./2, $fn=70);
	  }
   //shaft hole
	translate([0,0,19+2.5-2-5])difference(){
   cylinder(h=20, r=6.3/2,$fn=70);
   translate([2.7,-3,0]) cube(size=[3,6,23]);
   } 
} 
 union(){
    //shaft nut and hole
    translate([0,0,18+7]) rotate([0,90,0])cylinder(h=15, r=3.2/2, $fn=70);
     translate([3.5,-5.5/2,14+7]) cube(size=[2.4,5.5,8]);
 }  

}
//end cap 
translate([-18,0,0]) difference(){
   union(){
   translate([0,0,2]) cylinder(h=2, r1=35./2,r2=25./2, $fn=70);
   cylinder(h=2, r=35./2, $fn=70);
}
   translate([0,0,-0.2])cylinder(h=6, r=18.3/2, $fn=70);
}


translate([0,35,0])difference(){
   union(){
   translate([0,0,1]) cylinder(h=2, r1=35./2,r2=25./2, $fn=70);
   cylinder(h=1, r=35./2, $fn=70);
}
   translate([0,0,-0.2])cylinder(h=6, r=18.3/2, $fn=70);
}

translate([0,-35,0])difference(){
   union(){
   translate([0,0,1]) cylinder(h=2, r1=35./2,r2=25./2, $fn=70);
   cylinder(h=1, r=35./2, $fn=70);
   cylinder(h=5+2, r=25./2, $fn=70);
   
}
   translate([0,0,-0.2])cylinder(h=10, r=18.3/2, $fn=70);
   translate([-13,0,5]) rotate([0,90,0]) cylinder(h=26, r=1.5/2, $fn=30);
}
