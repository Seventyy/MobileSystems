extends CanvasLayer


var _stack: Array[Control] = []


func push(control: Control) -> void:
	assert(is_instance_valid(control))
	assert(not control.is_inside_tree())
	
	add_child(control)
	_stack.push_back(control)


func pop() -> void:
	var back: Control = _stack.pop_back()
	
	if not is_instance_valid(back):
		push_warning("[GUI] Trying to pop an empty stack.")
		return
	
	back.queue_free()


func clear() -> void:
	for control in _stack:
		control.queue_free()
	_stack.clear()
