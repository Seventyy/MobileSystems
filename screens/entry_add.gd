extends Control


var current_entry: Entry = null


func _ready() -> void:
	%Stars.update(%Rating.value)


func load_entry(entry: Entry = null) -> void:
	if not is_instance_valid(entry):
		return
	current_entry = entry
	%Name.text = entry.name
	%Date.text = entry.date_of_visit
	%Description.text = entry.description
	%Rating.value = entry.rating
	%Title.text = "Edit %s" % entry.name


func _on_confirm_pressed() -> void:
	if is_instance_valid(current_entry): # edit mode
		current_entry.name = %Name.text
		current_entry.date_of_visit = %Date.text
		current_entry.description = %Description.text
		current_entry.rating = %Rating.value
	else: # add mode
		Storage.add_entry(
			Entry.create(
				%Name.text,
				%Date.text,
				%Description.text,
				%Rating.value
			)
		)
	
	GUI.clear()
	GUI.push(load("res://screens/entry_list.tscn").instantiate())


func _on_cancel_pressed() -> void:
	GUI.clear()
	GUI.push(load("res://screens/entry_list.tscn").instantiate())


func _on_rating_value_changed(value: float) -> void:
	%Stars.update(value)
