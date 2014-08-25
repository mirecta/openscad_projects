hole=4.5;
material=4;
lenght=14;
width=13;
radius=(hole+2*material)/2;

module clip(){
difference(){
hull(){
cube([lenght,hole+2*material,width]);
translate([lenght,radius])cylinder(r=radius,h=width, $fn=40);
}
hull(){
translate([0,material])cube([lenght,hole,width]);
translate([lenght,hole/2+material])cylinder(r=hole/2,h=width,$fn=20);

}

}
//pads
translate([material/2,material/2+0.4])cylinder(r=material/2,h=width,$fn=20);

translate([material/2,material + material/2 + hole-0.4])cylinder(r=material/2,h=width,$fn=20);
}


clip();