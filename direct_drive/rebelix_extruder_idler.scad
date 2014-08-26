//color([0.5,0,0,0.2])translate([-5.5,-3])import("Tito_Extruder_V3_-_Armextended.stl");

//translate ([6,6,2])cylinder(r=8/2,h=10,$fn=50);


arm_width = 6.5;
base_pos = [-1,0,0];
arm_height = 3.1 + 2.7;

module arm_part(){
translate([-arm_width/2,0]){
  difference(){
  union(){
  cube([arm_width,11.8,arm_height]);
  translate([0,11.8-8])cube([arm_width,8,8 + arm_height]);
  translate([0,11.8])rotate([0,0,-40])cube([arm_width*cos(40),20,8 + arm_height]);
  }
    translate([-1,11.8-4,(8 + 2 * arm_height )/2]) 
    rotate([0,0,90])
     rotate([90,0,0])
     cylinder(r=4.6/2,h=20,$fn=30);
  }
  
}
}

module idler_arm_base(base_circle = [0,0,0],m3nut = false){
hull(){
translate(base_circle)cylinder(r=12.8/2,h=arm_height,$fn=40);
translate([-3.5,-14.65])cylinder(r=7.3/2,h=arm_height,$fn=40);
}
hull(){
translate(base_circle)cylinder(r=12.8/2,h=arm_height,$fn=40);
translate([8,2.15])cylinder(r=arm_width/2,h=arm_height,$fn=40);
}

translate([8,2.15])rotate([0,0,-50])arm_part();


if(m3nut == true)
 translate([-3.5,-14.65])cylinder(r=7.3/2,h=9+arm_height-2.4,$fn=40);
else
 translate([-3.5,-14.65])cylinder(r=7.3/2,h=9+arm_height,$fn=40);
 
translate(base_circle)cylinder(r=12/2,h=arm_height+0.5,$fn=40);
translate(base_circle)cylinder(r=7.8/2,h=9+arm_height,$fn=40);

}

module idler_arm_holes(base_circle = [0,0,0]){
translate([-3.5,-14.65,-1])cylinder(r=3.5/2,h=11+arm_height,$fn=20);
translate(base_circle)
difference(){
  translate([0,0,arm_height + 0.02])cylinder(r=24/2,h=11+arm_height,$fn=50);
  translate([0,0,arm_height + 0.02])cylinder(r=13/2,h=11+arm_height,$fn=50);
}
}

difference(){
idler_arm_base(base_pos,false);
idler_arm_holes(base_pos);
}
