// Container 20 B flat
// tole ondule


epb=2;		// epaisseur bords
lx=60;
ly=24.5;
lz=26;
hd=1.2;		//hole dia (in beams

difference()	{		// 2
union() {		//1
	// vertical 
    
	for(x=[-lx/2,lx/2-epb]) {
		for (y=[-ly/2,ly/2-epb]) {
			translate([x,y,-lz/2])
			cube([epb,epb,lz]);
		}	// for y
	}	// for x

	// horizontal in x
	for(y=[-ly/2,ly/2-epb]) {
		for (z=[-lz/2,lz/2-epb]) {
			translate([-lx/2,y,z])
			cube([lx,epb,epb]);
		}	// for z
	}	// for y

	// horizontal in y
	for(x=[-lx/2,lx/2-epb]) {
		for (z=[-lz/2,lz/2-epb]) {
			translate([x,-ly/2,z])
			cube([epb,ly,epb]);
		}	// for z
	}	// forx

// end of beams

// upper side (roof)
// base
translate([-lx/2,-ly/2,lz/2-2])
#cube([lx,ly,1]);

for ( i = [-lx/2+epb : 3 : lx/2-epb] ) {		// 3
	translate([i,-ly/2,lz/2-1.2])
	union() {		// 4
		cube ([1,ly,1]);
        //#cube ([1,1,lz]);
        
		rotate([0,-20,0])
		translate([0.5,0,-0.5])
		cube([1,ly,1]);

		rotate([0,20,0])
		translate([-0.5,0,-0.5])
		cube([1,ly,1]);

	}		// uni 4
}		// for  3

// side neg y
// base
translate([-lx/2,-ly/2+1,-lz/2])
cube([lx,1,lz]);


for ( i = [-lx/2+epb : 3 : lx/2-epb] ) {		// 3
	translate([i,-ly/2+epb-1.8,-lz/2])
	union() {		// 4
		cube ([1,1,lz]);
        #cube ([1,1,lz]);

/*
		rotate([0,0,-20])
		translate([0.5,0,0])
		cube([1,1,lz]);

		rotate([0,0,20])
		translate([-0.5,0,0])
		cube([1,1,lz]);
*/

	}		// uni 4
}		// for  3

// side pos y
// base
translate([-lx/2,ly/2-2,-lz/2])
cube([lx,1,lz]);


for ( i = [-lx/2+epb : 3 : lx/2-epb] ) {		// 3
	translate([i,ly/2-epb-0.2,-lz/2])
	union() {		// 4						
		translate([0,1,0])
		#cube ([1,1,lz]);

/*
		rotate([0,0,20])
		translate([0.5,0,0])
		cube([1,1,lz]);

		rotate([0,0,-20])
		translate([-0.5,0,-0.5])
		cube([1,1,lz]);
*/

	}		// uni 4
}		// for  3

// rear - no door
translate([-lx/2+1.2,-ly/2,-lz/2])
cube([1,ly,lz]);


for (i=[-lz/2+epb : 3 : lz/2-epb]) {		// 7
		translate([-lx/2+epb-1.6,-ly/2,i])
		cube([1,ly,1]);
}		// for 7

// front -  door
translate([lx/2-epb-1.2,-ly/2,-lz/2])
cube([1,ly,lz]);


for (i=[-lz/2+epb : 3 : lz/2-epb]) {		// 7
		translate([lx/2-epb,-ly/2,i])
		cube([1,ly,1]);
}		// for 7

// door separation
translate([lx/2-epb-0.3,-0.75,-lz/2])
cube([2,1.5,lz]);

//details

	// slot
	translate([lx/2-2,-4,-3])
	cube([2,8,1]);

	// charnieres
	for(y=[-ly/2+1,ly/2-3]) {
		for(z=[-10,6 ]) {
			translate([lx/2-1.5,y,z])
			cube([1,3,4]);

		}	// for z
	}	// for y

}		// uni 1

//----------------------------------------------------------------------------------------------------
// fixation holes
	// in lateral faces
//
	for(x=[-lx/2+epb/2,lx/2-epb/2]) {
	  	for (y=[-ly/2+epb,ly/2+epb]) {		
			for (z=[-lz/2+epb/2,lz/2-epb/2]) {

			translate([x, y  ,z])
			rotate([90,0,0])
			cylinder(r=hd/2,h=epb*2,$fn=24);
		}	// for z
	  }	// for y
	}	// for x
//

	// in front and rear faces
//
	for(x=[-lx/2-epb,lx/2-epb]) {
	  	for (y=[-ly/2+epb/2,ly/2-epb/2]) {		
			for (z=[-lz/2+epb/2,lz/2-epb/2]) {

			translate([x, y  ,z])
			rotate([0,90,0])
			cylinder(r=hd/2,h=epb*2,$fn=24);
		}	// for z
	  }	// for y
	}	// for x
//

	// in upper and lower faces
//
	for(x=[-lx/2+epb/2,lx/2-epb/2]) {
	  	for (y=[-ly/2+epb/2,ly/2-epb/2]) {		
			for (z=[-lz/2-epb,lz/2-epb]) {

			translate([x, y  ,z])
			rotate([0,0,0])
			cylinder(r=hd/2,h=epb*2,$fn=24);
		}	// for z
	  }	// for y
	}	// for x
//
}	// diff 2
translate([-lx/2,-ly/2,-lz/2])
cube([lx,ly,0.3]);