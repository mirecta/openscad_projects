module fan_duct_holder(){
   difference(){
    union(){
    cube([10,13.3,3]);
    translate([0,11.3-3,+3])cube([10,5,3]);   
    translate([-2,0,-24])cube([3,13.3,27]);
    translate([-13,0,-24])cube([13,13.3,6]);
    //translate([-13-3,0,-24-3])cube([3,13.5,3]);
   }
    translate([5,+4.5,-80+4])cylinder(r=3.2/2,h=80,$fn=15);
    translate([-5.5,18-5-4,-31])cylinder(r=3.5/2,h=20,$fn=20);
   translate([-5.5,18-5-4,-20.5])cylinder(r=6.03/2,h=3,$fn=6); 
   
   }
}


module fan_duct1(){

module duct(){
translate([-8,5])
difference(){
cube([16,8,3]);
translate([8,4,-1]){
hull(){
translate([0,0.5])cylinder(r=3.5/2,h=10,$fn=20);
translate([0,-2.4])cylinder(r=3.5/2,h=10,$fn=20);
}
}

}
difference(){
translate([-20,-40,0])cube([40,45,3]);
translate([-16,-4,-1])cylinder(r=3.5/2,h=6,$fn=20);
translate([16,-4,-1])cylinder(r=3.5/2,h=6,$fn=20);
translate([-16,-36,-1])cylinder(r=3.5/2,h=6,$fn=20);
translate([16,-36,-1])cylinder(r=3.5/2,h=6,$fn=20);
translate([0,-20,-1])cylinder(r=37/2,h=6,$fn=80);

}
difference(){
difference(){
union(){
hull(){
translate([0,-20,0])cylinder(r=37/2,h=8,$fn=80);
translate([-15,-30,17+17])cube([30,30,10]);
}
hull(){
translate([-15/2,-40,0])cube([15,30,1]);
translate([-20/2,-40,17+16])cube([20,30,1]);
}
}
hull(){
translate([0,-20,0])cylinder(r=37/2-1.5,h=8,$fn=80);
translate([-27/2,-27-1.5,17+17])cube([27,27,10]);
}
}
hull(){
translate([0,5,38])rotate([90,0,0])cylinder(r=27/2,h=39.5,$fn=50);
translate([0,5,35+10])rotate([90,0,0])cylinder(r=27/2,h=39.5,$fn=50);
}
}
}

difference(){
duct();
hull(){
translate([-(20-3)/2,-40+1.5,17+16])cube([20-3,30,1]);
translate([-(15-3)/2,-40+1.5,0])cube([15-3,30,1]);
}
translate([0,-35,17+23])rotate([90,0])cylinder(r=20/2,h=10,$fn=30);
}
}

translate([40,0,13.3])rotate([-90,0,0])fan_duct_holder();

fan_duct1();