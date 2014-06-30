

module skrutka(){
union(){
cylinder(r2=5.2/2, r1=9.4/2, h=2.6, $fn=30);
translate([0,0,0.01])cylinder(r=5.2/2, h=15, $fn=30);
}
}



difference(){
translate([-23,-22,0])cube([46,48,5]);
translate([0,7,-0.01])#cylinder(r=12.2/2, h=8, $fn=30);
translate([15.5,0,-0.01])#cylinder(r=3.2/2, h=8, $fn=20);
rotate([0,0,360/6])translate([15.5,0,-0.01])#cylinder(r=3.2/2, h=8, $fn=20);
rotate([0,0,360/6*2])translate([15.5,0,-0.01])#cylinder(r=3.2/2, h=8, $fn=20);
rotate([0,0,360/6*3])translate([15.5,0,-0.01])#cylinder(r=3.2/2, h=8, $fn=20);
rotate([0,0,360/6*4])translate([15.5,0,-0.01])#cylinder(r=3.2/2, h=8, $fn=20);
rotate([0,0,360/6*5])translate([15.5,0,-0.01])#cylinder(r=3.2/2, h=8, $fn=20);
}

difference(){
translate([-23,26,0])cube([46,6,40]);
#translate([13,25.99,23])rotate([-90,0,0])skrutka();
#translate([-13,25.99,23])rotate([-90,0,0])skrutka();
}
//color("red")translate([0,7,15.5])cylinder(r=17.5,h=15,$fn=50);


translate([20,26.01,0])rotate([0,90,0])linear_extrude(height=3) polygon(points = [[0,0],[-40,0],[0,-48]]);

difference(){
translate([-23,26.01,0])rotate([0,90,0])linear_extrude(height=3) polygon(points = [[0,0],[-40,0],[0,-48]]);

translate([-19,19.5,23])rotate([0,-90,0])#cylinder(r=5/2,h=5,$fn=20);
}

