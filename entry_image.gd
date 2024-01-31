class_name EntryImage extends TextureButton

@onready var texture_rect: TextureRect = $TextureRect

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pressed.connect(on_pressed)

func on_pressed() -> void:
	texture_rect.visible = true
	#owner.image_selected(self)

func deselect() -> void:
	texture_rect.visible = false
	
