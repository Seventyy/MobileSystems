extends Control


var current_entry: Entry = null


func load_entry(entry: Entry) -> void:
	current_entry = entry
	%Name.text = entry.name
	%Date.text = entry.date_of_visit
	%Description.text = entry.description
	%Image.texture = load("res://pictures/image" + str(entry.image) + ".png")
	%Stars.update(entry.rating)


func _on_confirm_pressed() -> void:
	GUI.clear()
	GUI.push(load("res://screens/entry_list.tscn").instantiate())


func _on_edit_pressed() -> void:
	var entry_add: Control = load("res://screens/entry_add.tscn").instantiate()
	entry_add.ready.connect(
		func(): entry_add.load_entry(current_entry)
	)
	GUI.clear()
	GUI.push(entry_add)


func _on_remove_pressed() -> void:
	Storage.remove_entry(current_entry)
	_on_confirm_pressed()
