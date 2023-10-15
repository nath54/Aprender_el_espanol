extends PanelContainer
class_name EltFiche

@export var words_1: Array = [];
@export var words_2: Array = [];
var initialized: bool = false;

var mot_node = preload("res://pages/menu_principal/FichesCustom/Mot.tscn");

func set_words_col(col: VBoxContainer, word_list: Array):
	# Cleaning
	for c in col.get_children():
		c.queue_free();
	# Colone
	col.add_child(Vide.new());
	for w in word_list:
		var mot: Mot = mot_node.instantiate();
		mot.mot = w;
		col.add_child(mot);
	col.add_child(Vide.new());


func _ready():
	pass


func _on_col_1_ready():
	set_words_col(%Col1, self.words_1);


func _on_col_2_ready():
	set_words_col(%Col2, self.words_2);
