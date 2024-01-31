class_name Entry extends Resource


@export var name: String = ""
@export var date_of_visit: String = ""
@export var description: String = ""
@export var rating: int = 0
@export var image:int = 0


@warning_ignore("shadowed_variable")
static func create(name: String, date_of_visit: String, description: String, rating: int, image: int) -> Entry:
	var instance := Entry.new()
	instance.name = name
	instance.date_of_visit = date_of_visit
	instance.description = description
	instance.rating = rating
	instance.image = image
	return instance

