extends Panel

@onready var unhide: Window = $".."

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	if unhide.size != Vector2i(size.x * scale.x, size.y * scale.y): unhide.size = Vector2i(size.x * scale.x, size.y * scale.y)
	
	if scale < Vector2(0.25, 0.25): scale = Vector2(0.25, 0.25)
	if Input.is_action_pressed("left click"):
		unhide.start_drag()
	
	if Input.is_action_pressed("down"):
		if scale > Vector2(0.25, 0.25): scale -= Vector2(0.01, 0.01)
	if Input.is_action_pressed("up"):
		scale += Vector2(0.01, 0.01)
	if Input.is_action_just_pressed("right"):
		scale = Vector2(0.25, 0.25)


func _on_button_pressed() -> void:
	Global.hidden(false)
	queue_free()
