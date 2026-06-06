extends Panel

@onready var window: Window = $".."
@onready var unhide: Button = $Unhide

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	window.grab_focus()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	if size != unhide.size + Vector2(20, 20):
		size = unhide.size + Vector2(20, 20)
		window.size = unhide.size + Vector2(20, 20)
	
	if scale < Vector2(0.25, 0.25): scale = Vector2(0.25, 0.25)
	if Input.is_action_pressed("left click"):
		window.start_drag()

func _on_button_button_down() -> void:
	Global.hidden(false)
	queue_free()
