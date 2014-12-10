use <obiscad/bevel.scad>
use <obiscad/attach.scad>
use <MCAD/nuts_and_bolts.scad>

module fan_pad(nut = false){
rotate([0,-90,0])
difference(){
if(nut){
cube([10,10,5]);
}else{
cube([10,10,5]);
}
translate([5,5])cylinder(r=3.3/2,h=6,$fn=20);
if (nut)
#translate([5,5,-0.1])nutHole(3);

}



}

difference(){
translate([-20,-40,0])cube([40,40,3]);
translate([-16,-4,-1])cylinder(r=3.5/2,h=6,$fn=20);
translate([16,-4,-1])cylinder(r=3.5/2,h=6,$fn=20);
translate([-16,-36,-1])cylinder(r=3.5/2,h=6,$fn=20);
translate([16,-36,-1])cylinder(r=3.5/2,h=6,$fn=20);
translate([0,-20,-1])cylinder(r=37/2,h=6,$fn=80);

}
difference(){
difference(){
hull(){
translate([0,-20,0])cylinder(r=37/2,h=8,$fn=80);
translate([-12.5,-25,32])cube([25,5,10]);
}
hull(){
translate([0,-20,0])cylinder(r=37/2-1.5,h=8,$fn=80);
translate([-12.5+1.5,-42+1.5+15+1.5,32])cube([25-3,5-3,10]);
//translate([-27/2,-27-1.5,7])cube([27,27,10]);
}
}
#translate([-30,-22,44])rotate([0,90,0])cylinder(r=8,h=50,$fn=50);
}

translate([2.5,0])fan_pad();
translate([2.5+5.3+5,0])fan_pad(true);
translate([-2.5-5.3,0])fan_pad();
