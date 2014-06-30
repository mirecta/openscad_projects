difference(){
hull(){
cylinder(r=10/2,h=4.8,$fn=30);
translate([0,30])cylinder(r=10/2,h=4.8,$fn=30);
}
cylinder(r=3.3/2, h=4.8, $fn=30);
translate([0,30])cylinder(r=3.3/2, h=4.8, $fn=30);
}
