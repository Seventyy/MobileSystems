extends Control


func _ready() -> void:
	Storage.load_entries()
	GUI.push(load("res://screens/entry_list.tscn").instantiate())


func _notification(what: int) -> void:
	match what:
		NOTIFICATION_PREDELETE:
			Storage.save_entries()


func create_safe_area() -> Control:
	var safe_area := Control.new()
	safe_area.name = "SafeArea"
	
	if not DisplayServer.is_touchscreen_available():
		return
	
	var safe_rect: Rect2i = DisplayServer.get_display_safe_area()
	safe_area.position = safe_rect.position
	safe_area.size = safe_rect.size
	return safe_area
