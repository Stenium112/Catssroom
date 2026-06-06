extends Panel

@onready var window: Window = $".."
@onready var line_edit: LineEdit = $LineEdit
@onready var close: Button = $Close

var mouse_in: bool

func _on_button_button_down() -> void:
	window.queue_free()

func _process(delta: float) -> void:
	if Input.is_action_pressed("left click") and mouse_in: window.start_drag()
	
	if size != line_edit.size + Vector2(close.size.x + 20, 0):
		size = line_edit.size + Vector2(close.size.x + 20, 0)
		window.size = size * scale.x


func _on_mouse_entered() -> void:
	mouse_in = true


func _on_mouse_exited() -> void:
	mouse_in = false
