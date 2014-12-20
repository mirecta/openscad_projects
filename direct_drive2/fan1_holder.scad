

module fan_pad(nut = false){
rotate([0,-90,0])
difference(){
if(nut){
cube([10,11,5]);
}else{
cube([10,11,5]);
}
translate([5,6])cylinder(r=3.3/2,h=6,$fn=20);
if (nut)
translate([5,6,-0.1])cylinder(r=6.1/2,h=2.5,$fn=6);

}

}
module holder(){
translate([-2,0,0])cube([22,6,2]);
difference(){
color([0.0,0.2,0,0.2])cube([20,3,10]);

translate([20-3,-1,5])rotate([-90,0,0])cylinder(r=3.2/2,h=10,$fn=20);
}

}


rotate([0,0,-90-60])holder();
translate([-15,-3,0])cube([30,3,10]);
translate([2.5,0])fan_pad();
translate([2.5+5.3+5,0])fan_pad(true);
translate([-2.5-5.3,0])fan_pad();
