material = 5;
width = 30;
height = 85;

module podpera(){
difference(){

translate([-width/2,-50,0])cube([width,height,material]);
translate([0,-22/cos(35),-0.01])#cylinder(r=5.2/2, h=8,$fn=20);
translate([0,(height-50)/2,-0.01])#cylinder(r=5.2/2, h=8,$fn=20);

translate([0,-37/cos(35),0])
 rotate([0,0,35])
  translate([-((width*2)/cos(35))/2,-50,-0.5])
     cube([(width*2)/cos(35),50,material+1]);


}

difference(){
translate([0,0,material])
rotate([90,0,35])
translate([-width,0,-material])
difference(){
 cube([width*2,37,material]);
 translate([width,22,-0.01])
   #cylinder(r=5.2/2,h=8,$fn=20);
   
}
translate([width/2,-height/2,-1])cube([width*2,height,37+material+2]);
translate([-width/2-width*2,-height/2,-1])cube([width*2,height,37+material+2]);
}
}
translate([(width)/2+2.5,0,0])podpera();
translate([-(width)/2-2.5,0,0])mirror([1,0,0]) podpera();

