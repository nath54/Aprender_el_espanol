extends Button

@export var texte = "";

func _on_label_ready():
	$HBoxContainer/Label.text = texte;

func _ready():
	focus_mode = FOCUS_NONE;
