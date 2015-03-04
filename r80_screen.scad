// windscreen bracket for R80RT
// this is normally a brass and two studs which 
// push out from outside the fairing to hold the lower 
// part of the screen on.

// this will print a holder for the inside
// as well as an outer plate to take the 10mm nuts.


// dimensions for inside piece i_
i_x = 100;
i_y=21;
i_z=3;

holes_apart=71.6;
hole_1x=(i_x/2) - (holes_apart/2);
hole_2x=(i_x/2) + (holes_apart/2);

bolt_r=(6.75/2);
bolt_head=12.5/2;

main();


module main(){
	back_plate_with_holes();
	//rotate([0,180,0]) front_plate_with_holes();
	
}

module back_plate_with_holes(){
	x1=hole_1x;
	x2=hole_2x;
	y=i_y/2;
	z=-(i_z+1)-2;
	difference(){
		back_plate(0,0,-3,i_z);
		bolt_shaft(x1,y,z,i_z+2);
		bolt_shaft(x2,y,z,i_z+2);		
	}
	difference(){
		back_plate(0,0,0,i_z);
		bolt_head(x1,y,z);
		bolt_head(x2,y,z);		
	}


}


module front_plate_with_holes(){
	x1=hole_1x;
	x2=hole_2x;
	y=i_y/2;
	z=-(i_z+1)-2;
	difference(){
			front_plate();
			bolt_shaft(x1,y,z-2, 20);
			bolt_shaft(x2,y,z-2, 20);
	}
}

module front_plate(){
	x1=hole_1x;
	x2=hole_2x;
	y=i_y/2;
	z=-(i_z+1)-2;
	
	back_plate(0,0,-3,i_z);		
	back_plate(0,0,0,i_z);
	proud_head(x1,y,z);
	proud_head(x2,y,z);		


}

module back_plate(x,y,z, thickness){

	color("red") translate([x,y,z]) cube([i_x,i_y,thickness]);
}

module bolt_shaft(x,y,z, h1){
	$fn=20;
	color("black") translate([x,y,z])	cylinder(h=h1, r=bolt_r ,center=false);
}

module bolt_head(x,y,z){
	$fn=6;
	translate([x,y,z])	cylinder(h=10, r=bolt_head ,center=false);
}

module proud_head(x,y,z){
	$fn=20;
	color("blue") translate([x,y,z])	cylinder(h=3, r=bolt_head ,center=false);
}
