motor_diameter = 42+1;
height = 10;
module motor_fan_holder(){
difference(){
translate([-43.8/2-height,16.9-3])cube([43.8+height,12,3]);
cylinder(r=motor_diameter/2,h=10,$fn=40);
translate([36.5/2,36.5/2])cylinder(r=3.3/2,h=10, $fn=20);
translate([-36.5/2,36.5/2])cylinder(r=3.3/2,h=10, $fn=20);   
}

 translate([-43.8/2-height,11])difference(){
    
   cube([4,15,46]);
    translate([-1,15/2-2,9])rotate([0,90])cylinder(r=3.3/2,h=10,$fn=20); 
    translate([-1,15/2-2,9+32])rotate([0,90])cylinder(r=3.3/2,h=10,$fn=20); 
}
}

rotate([])translate([0,-16.9+3-12])motor_fan_holder();