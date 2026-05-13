extends Panel

var mouse_offset: Vector2
var is_dragging: bool
var mouse_in: bool

func _on_close_pressed() -> void:
	await get_tree().create_timer(0.1).timeout
	if is_dragging != false: return
	Global.quit(0, "Close button pressed")

func _on_hide_pressed() -> void:
	await get_tree().create_timer(0.1).timeout
	if is_dragging != false: return
	Global.hidden()

func _process(delta: float) -> void:
	
	if scale < Vector2(0.25, 0.25): scale = Vector2(0.25, 0.25)
	
	if Input.is_action_pressed("down"):
		if scale > Vector2(0.25, 0.25): scale -= Vector2(0.01, 0.01)
	if Input.is_action_pressed("up"):
		scale += Vector2(0.01, 0.01)
	if Input.is_action_just_pressed("right"):
		scale = Vector2(0.25, 0.25)
	
	
	if Input.is_action_just_pressed("left click") and mouse_in:
		mouse_offset = global_position - get_global_mouse_position()
		is_dragging = true
	
	if is_dragging: global_position = get_global_mouse_position() + mouse_offset
	
	if Input.is_action_just_released("left click"):
		is_dragging = false

func _on_chrono_pressed() -> void:
	await get_tree().create_timer(0.1).timeout
	if is_dragging != false: return
	var chrono := preload("res://chrono.tscn")
	add_sibling(chrono.instantiate())


func _on_mouse_entered() -> void:
	mouse_in = true


func _on_mouse_exited() -> void:
	mouse_in = false
