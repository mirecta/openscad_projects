

translate([0,0,40+1.5])
rotate([180,0,0])
difference(){
translate([-24-1.5,-23-1.5,0])cube([48+1.5*2,48+8+1.5*2,40+1.5]);
translate([-24,-23,-1])cube([48,48+8,41]);
translate([-24-1.6,34.5-2.5,-0.1])cube([48+1.6*2,10,55]);
/*translate([-19,19.5,37])rotate([0,-90,0])#cylinder(r=5/2,h=10,$fn=20);
translate([-26,19.5-5/2,-0.1])#cube([3,5,37]);
translate([-19,-12,37])rotate([0,-90,0])#cylinder(r=5/2,h=10,$fn=20);
translate([-26,-12-5/2,-0.1])#cube([3,5,37]);
*/}