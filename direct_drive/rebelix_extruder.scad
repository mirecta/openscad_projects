use <obiscad/bevel.scad>
use <obiscad/attach.scad>
use <MCAD/nuts_and_bolts.scad>

//color([0.5,0,0,0.5])translate([-24.2,-26.2,-39.15]) import(file="ext.stl");

module miro_extruder_base(){

ec1 = [[49-24.5,48-26,2.5],[0,0,1],0];
en1 = [ec1[0],[1,1,0],0];

ec2 = [[-24.5,48-26,2.5],[0,0,1],0];
en2 = [ec2[0],[-1,1,0],0];

//base
difference(){
translate([-24.5,-26,0])cube([49,48,5]);
bevel(ec1,en1,cr=6,cres=20,l=5+1);
bevel(ec2,en2,cr=6,cres=20,l=5+1);
}

ec3 = [[24.5,-26+5,2.5],[0,0,1],0];
en3 = [ec3[0],[1,1,0],0];

ec4 = [[1,-2,5],[0,1,0],0];
en4 = [ec4[0],[-1,0,1],0];

ec5 = [[1,-21,8],[0,0,1],0];
en5 = [ec5[0],[-1,1,0],0];

ec6 = [[8,0,16],[1,0,0],0];
en6 = [ec6[0],[0,1,1],0];

ec7 = [[-24.5+2.5,-26+20,5],[1,0,0],0];
en7 = [ec7[0], [0,1,1],0];

ec8 = [[-24.5+5,-26+2.5,16],[0,1,0],0];
en8 = [ec8[0],[1,0,1],0];
//connector(ec8);
//connector(en8);
//walls
union(){
//main wall
translate([-24.5,-26,0]) cube([54,5,16]);


//bconcave_corner_attach(ec3,en3,l=5,cr=7,cres=20);

//upper filament tray
translate([1,0,0])cube([8,22,16]);
//hotend nut holder lower filament tray
translate([-3,-26,0])cube([15,15.5,16]);


bconcave_corner_attach(ec4,en4,l=48,cr=11,cres=20);
bconcave_corner_attach(ec5,en5,l=16,cr=11,cres=20);
}

//idler pad
translate([0,0,0])
translate([21.5,-13.2])
difference(){
rotate([0,0,-40])
difference(){
translate([0,-10.7,0])cube([16,10.7,16]);
bevel(ec6,en6,cr=3,cres=20,l=20);

}
translate([8*cos(40),-20,-1])cube([20,40,20]);
translate([-20,-8/cos(90-40)-20,-1])cube([40,20,20]);

}

//xcarriage  grip 
translate([-24.5,-26,0])
difference(){
cube([5,20,42+5]);
translate([-1,10,6+5])rotate([0,90,0])cylinder(r=3.3/2,h=10,$fn=20);
translate([-1,10,6+5+30])rotate([0,90,0])cylinder(r=3.3/2,h=10,$fn=20);
}
bconcave_corner_attach(ec7,en7,l=5,cr=20,cres=30);
bconcave_corner_attach(ec8,en8,l=5,cr=15,cres=30);

//fan grip 

}

module nema_m3_hole(pos){
dia = 3.8;
translate(pos)
hull(){
translate([dia/2-0.5,0,-1])cylinder(r=dia/2,h=20,$fn=20);
translate([-dia/2+0.5,0,-1])cylinder(r=dia/2,h=20,$fn=20);
}
}

module m4_idler(){
cylinder(r=4.3/2,h=40,$fn=20);
cylinder(r=8/2,h=15,$fn=20);
}

module fan_pad(nut = false){
difference(){
hull(){
translate([-5,-5/2,0])cube([5,5,5]);
translate([-12.5,-2.5,0])cylinder(r=10/2,h=5,$fn=20);

}
translate([-12.5,-2.5,-0.5])cylinder(r=3.3/2,h=6,$fn=20);
if (nut)
translate([-12.5,-2.5,-0.1])nutHole(3);
}
}

module fan_holder(){
translate([0,0,-(5.3*2+5.3/2)])fan_pad(true);
translate([0,0,-5.3/2])fan_pad();
translate([0,0,5.3+5.3/2])fan_pad();
}

module fan2_holder(){
difference(){
translate([0,4])cube([10,8,16]);
translate([4,5,8-5.8/2])cube([3,10,5.8]);
translate([3,8,8])rotate([0,90,0])cylinder(r=3.3/2, h=20, $fn=20);
//translate([3+9/2,9.8,8])rotate([-90,0,0])rotate([0,0,90])nutHole(3);
}
}


difference(){

miro_extruder_base();
//nema17hole
translate([0,0,-1])cylinder(r=24/2,h=20,$fn=50);
//screw holes
nema_m3_hole([15.5,15.5,0]);
nema_m3_hole([-15.5,15.5,0]);
nema_m3_hole([-15.5,-15.5,0]);
nema_m3_hole([15.5,-15.5,0]);
//filament hole
translate([5,30,8.5])rotate([90,0,0])cylinder(r=2.5/2,h=60,$fn=20);
//hotend hole
translate([5,-26+12,8.5])rotate([90,0,0])cylinder(r=6.5/2,h=20,$fn=20);
//nut m6 hole
translate([5-5.5,-26+5,2.5])cube([10.5,4,20]);
//idler hole
translate([7.5,-36,8+2.1])rotate([0,0,-40])rotate([-90,0,0])m4_idler();
translate([13,0,5.1])cylinder(r=24/2,h=20,$fn=50);
}
//fan holders
translate([5,-26+2.5,16])rotate([0,90,0])fan_holder();

translate([29.5,-26-12+5,])fan2_holder();
