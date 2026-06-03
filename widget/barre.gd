extends Panel

# Button is being pressed after releasing drag :/ sadness

var mouse_offset: Vector2
var is_dragging: bool
var mouse_in: bool

var real_size: Vector2i

@onready var window: Window = $".."

func _on_close_button_down() -> void:
	if is_dragging != false: return
	
	Global.quit(0, "Close button pressed")

func _on_hide_button_down() -> void:
	if is_dragging != false: return
	Global.hidden()

func _process(_delta: float) -> void:
	
	
	
	if scale < Vector2(0.25, 0.25): scale = Vector2(0.25, 0.25)
	if Input.is_action_pressed("left click") and mouse_in:
		is_dragging = true
		window.start_drag()
	else: is_dragging = false
	
	#if Input.is_action_pressed("down"):
		#if scale > Vector2(0.25, 0.25): scale -= Vector2(0.01, 0.01)
	#if Input.is_action_pressed("up"):
		#scale += Vector2(0.01, 0.01)
	#if Input.is_action_just_pressed("right"):
		#scale = Vector2(0.25, 0.25)
		#Here to rework for ajust height


func _on_chrono_button_down() -> void:
	if is_dragging != false: return
	var chrono := preload("res://widget/chrono.tscn")
	add_sibling(chrono.instantiate())


func _on_mouse_entered() -> void:
	mouse_in = true


func _on_mouse_exited() -> void:
	mouse_in = false


func _on_parameters_button_down() -> void:
	pass # Replace with function body.
