extends Window

var mouse_offset : Vector2i

@onready var panel: Panel = $Panel

func _on_close_pressed() -> void:
	Global.quit(0, "Close button pressed")

func _on_hide_pressed() -> void:
	Global.hidden = true

func _process(delta: float) -> void:
	if Input.is_action_pressed("left click"):
		start_drag()
