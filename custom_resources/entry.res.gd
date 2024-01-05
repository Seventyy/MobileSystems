class_name Entry extends Resource


@export var name: String = ""
@export var date_of_visit: String = ""
@export var description: String = ""
@export var rating: int = 0
@export var photo: Image = null


@warning_ignore("shadowed_variable")
static func create(name: String, date_of_visit: String, description: String, rating: int, photo: Image = null) -> Entry:
	var instance := Entry.new()
	instance.name = name
	instance.date_of_visit = date_of_visit
	instance.description = description
	instance.rating = rating
	instance.photo = photo
	return instance

