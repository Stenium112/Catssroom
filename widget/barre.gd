extends Window

var mouse_offset : Vector2i

@onready var panel: Panel = $Panel

func _on_close_pressed() -> void:
	Global.quit(0, "Close button pressed")

func _on_hide_pressed() -> void:
	Global.hidden = true

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("left click"):
		mouse_offset = panel.get_local_mouse_position()
	if Input.is_action_pressed("left click"):
		position = (position + Vector2i(panel.get_global_mouse_position()) - mouse_offset)
