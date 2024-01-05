extends Node


const ENTRIES_FILEPATH: String = "user://entries.tres"

var _storage: EntryStorage = null


func _ready() -> void:
	_init_entries_file()


func _init_entries_file() -> void:
	if not FileAccess.file_exists(ENTRIES_FILEPATH):
		ResourceSaver.save(EntryStorage.new(), ENTRIES_FILEPATH)


func load_entries() -> void:
	_storage = ResourceLoader.load(ENTRIES_FILEPATH)


func save_entries() -> void:
	ResourceSaver.save(_storage, ENTRIES_FILEPATH)


func get_entries() -> Array[Entry]:
	return _storage.entries


func add_entry(entry: Entry) -> void:
	_storage.entries.append(entry)


func remove_entry(entry: Entry) -> void:
	_storage.entries.erase(entry)


func delete_all() -> void:
	_storage.entries.clear()
	save_entries()

