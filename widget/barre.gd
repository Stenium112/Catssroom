extends Window

var mouse_offset : Vector2i

@onready var panel: Panel = $Panel

func _on_close_pressed() -> void:
	Global.quit(0, "Close button pressed")

func _on_hide_pressed() -> void:
	Global.hidden = true

func _process(delta: float) -> void:
	if size != Vector2i(panel.size.x * panel.scale.x, panel.size.y * panel.scale.y): size = Vector2i(panel.size.x * panel.scale.x, panel.size.y * panel.scale.y)
	
	
	if panel.scale < Vector2(0.25, 0.25): panel.scale = Vector2(0.25, 0.25)
	if Input.is_action_pressed("left click"):
		start_drag()
	
	if Input.is_action_pressed("down"):
		if panel.scale > Vector2(0.25, 0.25): panel.scale -= Vector2(0.01, 0.01)
	if Input.is_action_pressed("up"):
		panel.scale += Vector2(0.01, 0.01)
	if Input.is_action_just_pressed("right"):
		panel.scale = Vector2(0.25, 0.25)
