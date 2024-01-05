class_name EntryList extends Control

@onready var list: ItemList = %ItemList
@onready var delete_all: Button = %DeleteAll
@onready var delete_progress: ProgressBar = %DeleteProgress


func _ready() -> void:
	refresh_list()


func refresh_list() -> void:
	list.clear()
	for entry in Storage.get_entries():
		add_entry(entry)


func add_entry(entry: Entry) -> void:
	list.add_item(entry.name)


func _process(delta: float) -> void:
	if delete_all.button_pressed:
		delete_progress.value += delta
		if delete_progress.value >= delete_progress.max_value:
			Storage.delete_all()
			refresh_list()
	else:
		delete_progress.value = .0


func _on_add_pressed() -> void:
	GUI.pop()
	GUI.push(load("res://screens/entry_add.tscn").instantiate())


@warning_ignore("unused_parameter")
func _on_item_list_item_clicked(index: int, at_position: Vector2, mouse_button_index: int) -> void:
	GUI.clear()
	var entry_view: Control = load("res://screens/entry_view.tscn").instantiate()
	entry_view.ready.connect(
		func(): entry_view.load_entry(Storage.get_entries()[index])
	)
	GUI.push(entry_view)
