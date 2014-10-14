//75.5
//90

//21.9

rd=49/2;
holes=6;
$fn=50;



difference(){
union(){
cylinder(r=90/2,h=3);
cylinder(r=75.2/2,h=10);

}
translate([0,0,3])cylinder(r=75.2/2-2,h=7);

for( t = [1:holes] ){
#translate([rd*cos(360/holes*t),rd*sin(360/holes*t),0])cylinder(r=18/2,h=3);
}
cylinder(r=22.8/2,h=7);
}
difference(){
cylinder(r=22/2+2,h=7+3);
cylinder(r=22.8/2,h=7);
translate([0,0,7+0.35])cylinder(r=13/2,h=3);
}