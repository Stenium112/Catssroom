extends Panel

@onready var window: Window = $".."
@onready var text_edit: TextEdit = $TextEdit
@onready var close: Button = $Close

var mouse_in: bool

func _ready() -> void:
	text_edit.autowrap_mode = TextServer.AUTOWRAP_OFF

func _input(event: InputEvent) -> void:
	if Input.is_action_pressed("left click") and mouse_in:
		window.start_drag()

func _process(delta: float) -> void:
	if size != text_edit.size + Vector2(close.size.x + 20, 0):
		size = text_edit.size + Vector2(close.size.x + 20, 0)
		window.size = size * scale.x


func _on_mouse_entered() -> void:
	mouse_in = true

func _on_mouse_exited() -> void:
	mouse_in = false


func _on_button_button_down() -> void:
	if Input.is_action_just_pressed("left click"):
		window.queue_free()
