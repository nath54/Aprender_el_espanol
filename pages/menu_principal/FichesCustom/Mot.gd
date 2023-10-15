extends Control
class_name Mot

@export var mot: String = "";

func _on_texte_ready():
	$texte.text = mot;
