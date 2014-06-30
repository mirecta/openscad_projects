translate([35/2+5,0,0])
difference(){
union(){
cylinder(r=15/2, h=17, $fn=50);
cylinder(r=25/2, h=11, $fn=50);

cylinder(r=35/2, h=2, $fn=50);
translate([0,0,2])cylinder(r1=35/2, r2=25/2, h=4, $fn=50);
}
translate([0,0,-0.01])#cylinder(r=6.2/2,h=20,$fn=30);
}


translate([-35/2-5,0,0])
difference(){
union(){

cylinder(r=35/2, h=2, $fn=50);
translate([0,0,2])cylinder(r1=35/2, r2=25/2, h=4, $fn=50);
}
translate([0,0,-0.01])#cylinder(r=15.1/2, h=8, $fn=50);
}