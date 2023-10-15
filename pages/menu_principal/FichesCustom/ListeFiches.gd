extends Control

const DATA_PATH: String = "res://data/fiches/";
@onready var ListeFiches = $ScrollContainer/CenterContainer/VBoxContainer/VBoxContainer/ScrollContainer/ListeFiches;

func list_files_in_directory(path: String) -> Array[String]:
	var files: Array[String] = [];
	var dir: DirAccess = DirAccess.open(path);
	dir.list_dir_begin();
	#
	while true:
		var file: String = dir.get_next();
		if file == "":
			break
		elif not file.begins_with("."):
			files.append(file);
	#
	dir.list_dir_end();
	#
	return files;


func load_file(path: String):
	var txt: String = FileAccess.get_file_as_string(path)
	var data = JSON.parse_string(txt)
	return data;

func _on_bt_retour_pressed():
	get_tree().change_scene_to_file("res://pages/menu_principal/MainMenu.tscn");


func add_fiche_button(f_name: String, f_path: String):
	var mbt: Button = Button.new();
	var hbc: HBoxContainer = HBoxContainer.new();
	var lbl: Label = Label.new();
	hbc.add_child(lbl);
	mbt.add_child(hbc);
	#
	mbt.set_custom_minimum_size(Vector2(500, 45));
	hbc.set_anchors_preset(PRESET_FULL_RECT);
	lbl.text = f_name;
	#
	ListeFiches.add_child(mbt);
	#
	mbt.pressed.connect(click_fiche_bt.bind(f_path));
	#
	return mbt;


func click_fiche_bt(fp: String):
	Global.ouverture_fiche = fp;
	get_tree().change_scene_to_file("res://pages/menu_principal/FichesCustom/Fiche.tscn");


func _ready():
	#
	for fp in list_files_in_directory(DATA_PATH):
		if fp.ends_with(".json"):
			var data = load_file(DATA_PATH+fp);
			add_fiche_button(data["nom"], DATA_PATH+fp);

