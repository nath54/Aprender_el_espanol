extends Node

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


func load_file(path: String) -> Dictionary:
	var txt: String = FileAccess.get_file_as_string(path)
	var data: Dictionary = JSON.parse_string(txt)
	return data;
