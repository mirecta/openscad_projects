translate([35/2+5,0,0])
difference(){
union(){
cylinder(r=22/2, h=17, $fn=50);
cylinder(r=25/2, h=11, $fn=50);

cylinder(r=35/2, h=2, $fn=50);
translate([0,0,2])cylinder(r1=35/2, r2=25/2, h=4, $fn=50);
}
translate([0,0,7+0.3])#cylinder(r=6.0/2,h=5,$fn=30);
translate([0,0,0])#cylinder(r=16.4/2,h=7,$fn=30);
translate([0,0,10])#cylinder(r=16.4/2,h=7,$fn=30);
}


translate([-35/2-5,0,0])
difference(){
union(){

cylinder(r=35/2, h=2, $fn=50);
translate([0,0,2])cylinder(r1=35/2, r2=25/2, h=4, $fn=50);
}
translate([0,0,-0.01])#cylinder(r=22.5/2, h=8, $fn=50);
}




module cover(){
difference(){
cylinder(r=16/2,h=1.8,$fn=30);
cylinder(r=5.3/2,h=1.8,$fn=30);
}
}

translate([0,20]) cover();
translate([0,-20]) cover();