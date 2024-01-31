extends Control


var current_entry: Entry = null


func _ready() -> void:
	%Stars.update(%RatingEdit.value)
	%DateEdit.text_changed.connect(on_text_changed)
	#for i in %Images.get_children():
		#i.pressed.connect(on_)


func load_entry(entry: Entry = null) -> void:
	if not is_instance_valid(entry):
		return
	current_entry = entry
	%NameEdit.text = entry.name
	%DateEdit.text = entry.date_of_visit
	%DescriptionEdit.text = entry.description
	%RatingEdit.value = entry.rating
	%Title.text = "Edit %s" % entry.name
	%Images.select_image(entry.image)


func _on_confirm_pressed() -> void:
	if is_instance_valid(current_entry): # edit mode
		current_entry.name = %NameEdit.text
		current_entry.date_of_visit = %DateEdit.text
		current_entry.description = %DescriptionEdit.text
		current_entry.rating = %RatingEdit.value
		current_entry.image = %Images.selected_image
	else: # add mode
		Storage.add_entry(
			Entry.create(
				%NameEdit.text,
				%DateEdit.text,
				%DescriptionEdit.text,
				%RatingEdit.value,
				%Images.selected_image
			)
		)
	
	GUI.clear()
	GUI.push(load("res://screens/entry_list.tscn").instantiate())


func _on_cancel_pressed() -> void:
	GUI.clear()
	GUI.push(load("res://screens/entry_list.tscn").instantiate())


func on_text_changed(new:String) -> void:
	if new.length() == 4:
		%DateEdit.text += "."
		%DateEdit.caret_column = 100
	if new.length() == 5:
		%DateEdit.text = %DateEdit.text.erase(4)
		%DateEdit.caret_column = 100
	if new.length() == 7:
		%DateEdit.text += "."
		%DateEdit.caret_column = 100
	if new.length() == 8:
		%DateEdit.text = %DateEdit.text.erase(7)
		%DateEdit.caret_column = 100

func _on_rating_value_changed(value: float) -> void:
	%Stars.update(value)
