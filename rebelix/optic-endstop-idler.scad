translate([2.5,0]){
cube([17,10,1.5]);
cube([5,2,8]);
}

mirror([1,0,0])
translate([2.5,0]){
difference(){
cube([17,10,1.5]);
translate([5,0])#cube([12,4.5,1.5]);
}
cube([5,2,8]);

}