extends Panel

var mouse_offset: Vector2
var is_dragging: bool
var mouse_in: bool

var real_size: Vector2i

@onready var window: Window = $".."

func _on_close_pressed() -> void:
	await get_tree().create_timer(0.1).timeout
	if is_dragging != false: return
	
	Global.quit(0, "Close button pressed")

func _on_hide_pressed() -> void:
	await get_tree().create_timer(0.1).timeout
	if is_dragging != false: return
	Global.hidden()

func _process(delta: float) -> void:
	
	if window.size != Vector2i(size): window.size = Vector2i(size)
	
	if scale < Vector2(0.25, 0.25): scale = Vector2(0.25, 0.25)
	if Input.is_action_pressed("left click"):
		window.start_drag()
	
	if Input.is_action_pressed("down"):
		if scale > Vector2(0.25, 0.25): scale -= Vector2(0.01, 0.01)
	if Input.is_action_pressed("up"):
		scale += Vector2(0.01, 0.01)
	if Input.is_action_just_pressed("right"):
		scale = Vector2(0.25, 0.25)


func _on_chrono_pressed() -> void:
	await get_tree().create_timer(0.1).timeout
	if is_dragging != false: return
	var chrono := preload("res://widget/chrono.tscn")
	add_sibling(chrono.instantiate())


func _on_mouse_entered() -> void:
	mouse_in = true


func _on_mouse_exited() -> void:
	mouse_in = false


func _on_hide_button_down() -> void:
	pass # Replace with function body.


func _on_close_button_down() -> void:
	pass # Replace with function body.


func _on_chrono_button_down() -> void:
	pass # Replace with function body.


func _on_parameters_button_down() -> void:
	pass # Replace with function body.
