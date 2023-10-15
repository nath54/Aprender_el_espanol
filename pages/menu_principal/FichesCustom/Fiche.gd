extends Control


var elt_node := preload("res://pages/menu_principal/FichesCustom/EltFiche.tscn");


# Called when the node enters the scene tree for the first time.
func _ready():
	if Global.ouverture_fiche != "":
		var data: Dictionary = Lib.load_file(Global.ouverture_fiche);
		#
		$ScrollContainer/CenterContainer/Container/HBoxContainer2/Titre.text = "Fiche : "+data["nom"];
		#
		for elt in data["elements"]:
			var wds1: Array = elt[0];
			var wds2: Array = elt[1];
			#
			var eltfiche: EltFiche = elt_node.instantiate();
			eltfiche.words_1 = wds1;
			eltfiche.words_2 = wds2;
			$ScrollContainer/CenterContainer/Container/Container.add_child(eltfiche);
			



func _on_bt_retour_pressed():
	get_tree().change_scene_to_file("res://pages/menu_principal/FichesCustom/ListeFiches.tscn");
