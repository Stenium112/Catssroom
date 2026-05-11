extends Panel

var mouse_offset: Vector2
var is_dragging: bool

func _on_close_pressed() -> void:
	Global.quit(0, "Close button pressed")

func _on_hide_pressed() -> void:
	Global.hidden()
	

func _process(delta: float) -> void:
	
	if scale < Vector2(0.25, 0.25): scale = Vector2(0.25, 0.25)
	
	if Input.is_action_pressed("down"):
		if scale > Vector2(0.25, 0.25): scale -= Vector2(0.01, 0.01)
	if Input.is_action_pressed("up"):
		scale += Vector2(0.01, 0.01)
	if Input.is_action_just_pressed("right"):
		scale = Vector2(0.25, 0.25)

func _input(event: InputEvent) -> void:
	if Input.is_action_pressed("left click"):
		print(is_dragging)
		if get_local_mouse_position():
			is_dragging = true
			mouse_offset = get_local_mouse_position() - position
			print(mouse_offset)
		if is_dragging:
			print(position)
			position += mouse_offset

func _on_chrono_pressed() -> void:
	var chrono := preload("res://chrono.tscn")
	add_sibling(chrono.instantiate())
