extends Panel

@onready var window: Window = $".."
@onready var container: HBoxContainer = $HBoxContainer

var mouse_in: bool

func _ready() -> void:
	size = container.size + Vector2(20, 20)
	get_window().size = size * scale.x
	get_window().close_requested.connect(_on_close_requested)


func _process(_delta: float) -> void:
	if scale < Vector2(0.25, 0.25): scale = Vector2(0.25, 0.25)
	if size != container.size + Vector2(20, 20):
		print("barre")
		size = container.size + Vector2(20, 20)
	if get_window().size != Vector2i(size * scale.x):
		print("window")
		DisplayServer.window_set_size(Vector2i(size * scale.x))


func _input(event: InputEvent) -> void:
	if Input.is_action_pressed("left click") and mouse_in:
		get_window().start_drag()


func _on_mouse_entered() -> void:
	mouse_in = true


func _on_mouse_exited() -> void:
	mouse_in = false


func _on_parameters_button_down() -> void:
	if Input.is_action_just_pressed("left click"):
		var chrono := preload("res://widget/settings.tscn")
		add_sibling(chrono.instantiate())

func _on_text_button_down() -> void:
	if Input.is_action_just_pressed("left click"):
		var chrono := preload("res://widget/text.tscn")
		add_sibling(chrono.instantiate())

func _on_chrono_button_down() -> void:
	if Input.is_action_just_pressed("left click"):
		var chrono := preload("res://widget/chrono.tscn")
		add_sibling(chrono.instantiate())

func _on_close_button_down() -> void:
	if Input.is_action_just_pressed("left click"):
		Global.quit(0, "Close button pressed")

func _on_hide_button_down() -> void:
	if Input.is_action_just_pressed("left click"):
		Global.hidden()


func _on_close_requested() -> void:
	Global.quit(0, "Close requested")
