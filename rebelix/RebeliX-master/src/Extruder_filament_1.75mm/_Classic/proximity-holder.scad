include<../../../configuration.scad>
include<../../inc/functions.scad>

holder_height = 60;
sensor_diameter = 12;
$fn=50;
holes=18;
width = 18 + 2*5.5;
m3_diameter = 3.4;

module body(){
    hull(){
    translate([0,-0.5])cylinder(r=sensor_diameter/2+4,h=3);
    
    translate([-(sensor_diameter/2+4),-(sensor_diameter/2+4)])cube([sensor_diameter+8,sensor_diameter/2+4,3]);
    }
    hull(){
    translate([-(sensor_diameter+8)/2,-(sensor_diameter/2+4)-3])cube([sensor_diameter+8,3,3]);
     translate([-width/2,-(sensor_diameter/2+4)-3,holder_height-10])cube([width,3,10]);  
    }
}


module holes(){
    translate([0,-0.5])cylinder(r=sensor_diameter/2+.2,h=3);
    translate([0,0,holder_height-5])
    rotate([90,0]){
       translate([holes/2,0])cylinder(r=m3_diameter/2,h=40);
       translate([-holes/2,0])cylinder(r=m3_diameter/2,h=40);
    } 
}

rotate([90,0])
translate([0,sensor_diameter/2+4+3])
difference(){
    body();
    holes();
}