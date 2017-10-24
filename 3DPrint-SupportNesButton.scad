/* Permet de contruire un support pour les bouttons du boitier NES
By jeff le 10/2017
*/

//Declaration des variables

/* [Basic] */
//Depth buttons (in mm)
_depth_right_button = 20; //[1:30]
_diameter_button = 3; //[1:20]

/* [Right_button] */
//Diameter Right button (in mm)
_diameter_right_button = 10; //[1:20]



/* [Left_button] */
//Diameter Left button (in mm)
_diameter_left_button = 10; //[1:20]


/* [LED] */
//Diameter LED (in mm)
_diameter_led = 10; //[1:20]


/* [hidden] */
_epaisseur = 1.6;
_largeur = 38;
_hauteur_base_axe = 4;


//!Déclaration des variables

//Contruction de la base

base();

reglage(0);

*trou_bouton(10);

//Base horizontale
module base(){
	translate([-_largeur/2,0,-_epaisseur]){
		cube(size = [_largeur,15,_epaisseur], center = false);
	}	
	//Patte d'arret
	translate([-28/2,10,-3-_epaisseur]){
		cube(size = [28,3,3], center = false);
	}
}//!module base


module reglage(_profondeur){
//Patte verticale
translate([-_largeur/2,_profondeur,0]){
	cube(size = [_largeur,_epaisseur,12], center = false);
}




//Trous a droite
translate([7,0,_hauteur_base_axe]){
	trou_bouton(_diameter_button);
}

//Trous a gauche
translate([-6,0,_hauteur_base_axe]){
	trou_bouton(_diameter_button);
}

//Trous LED
translate([-14,0,_hauteur_base_axe]){
	rotate([90,0,0]){
		cylinder(h=_epaisseur*2,r=(_diameter_led/2),center=true);
	}
}




}//!Module reglage


module trou_bouton(_diametre){

	rotate([90,0,0]){
		cylinder(h=_epaisseur*2,r=(_diametre/2),center=true);
		
		translate([0,20/2,0]){
			cube(size = [_diametre,20,_epaisseur*2], center = true);
		}
		
	}//!rotate

}//!trou_bouton
	














