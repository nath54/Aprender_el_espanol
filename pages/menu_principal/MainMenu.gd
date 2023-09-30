extends Control



func _on_bt_quitter_pressed():
	get_tree().quit();


func _on_bt_parametres_pressed():
	pass # Replace with function body.


func _on_bt_notions_importantes_pressed():
	get_tree().change_scene_to_file("res://pages/menu_principal/NotionsImportantes/NotionsImportantes.tscn");


func _on_bt_lexique_pressed():
	pass # Replace with function body.


func _on_bt_fiches_customs_pressed():
	pass # Replace with function body.


func _on_bt_quiz_pressed():
	pass # Replace with function body.
