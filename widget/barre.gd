extends Window

var mouse_hover : bool = false

func _on_close_pressed() -> void:
	Global.quit(0, "Close button pressed")

func _on_hide_pressed() -> void:
	Global.hidden = true

func _process(delta: float) -> void:
	if Input.is_action_pressed("left click") and mouse_hover:
		pass

func _on_mouse_entered() -> void:
	mouse_hover = true


func _on_mouse_exited() -> void:
	mouse_hover = false
