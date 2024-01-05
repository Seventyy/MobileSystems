class_name Stars extends HBoxContainer


func update(visible_count: int) -> void:
	for i in get_child_count():
		get_child(i).visible = i < visible_count
