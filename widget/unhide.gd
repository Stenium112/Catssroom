extends Panel

@onready var window: Window = $".."
@onready var unhide: Button = $Unhide

var mouse_in: bool

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	window.grab_focus()

func _input(event: InputEvent) -> void:
	if Input.is_action_pressed("left click") and mouse_in:
		window.start_drag()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	if size != unhide.size + Vector2(20, 20):
		size = unhide.size + Vector2(20, 20)
		window.size = unhide.size + Vector2(20, 20)
	
	if scale < Vector2(0.25, 0.25): scale = Vector2(0.25, 0.25)


func _on_button_button_down() -> void:
	if Input.is_action_just_pressed("left click"):
		Global.hidden(false)
		window.queue_free()


func _on_mouse_entered() -> void:
	mouse_in = true


func _on_mouse_exited() -> void:
	mouse_in = false
