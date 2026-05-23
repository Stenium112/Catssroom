extends Panel

@onready var panel: Panel = $"."
@onready var label: Label = $Label
@onready var _1s: Timer = $"1s"
@onready var start: Button = $Start
@onready var pause: Button = $Buttons/Pause
@onready var buttons: HBoxContainer = $Buttons
@onready var close: Button = $Close

var time: float = 0
var mouse_offset: Vector2
var is_dragging: bool
var mouse_in: bool

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	arrange_string(time)
	
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


func arrange_string(_time: float) -> void:
	var dict: Dictionary = convert_time(_time)
	var array: Array = [str(dict["Hours"]), str(dict["Minutes"]).pad_zeros(2), str(dict["Seconds"]).pad_zeros(2)]
	if dict["Hours"] == 0: array.remove_at(0)
	
	
	var ms: String = str(_time).pad_decimals(1).right(1)
	label.text = ":".join(array) + "." + ms
	


func convert_time(seconds: int):
	var hours = int(seconds / 3600)
	var minutes = int((seconds % 3600) / 60)
	var remainingSeconds = int(seconds % 60)
	return {
		"Hours": hours,
		"Minutes": minutes,
		"Seconds": remainingSeconds
		}


func _on_s_timeout() -> void:
	time += 0.1


func _on_start_pressed() -> void:
	await get_tree().create_timer(0.1).timeout
	if is_dragging != false: return
	
	if _1s.is_stopped(): _1s.start()
	elif _1s.paused: _1s.paused = false
	start.visible = false
	buttons.visible = true


func _on_pause_pressed() -> void:
	await get_tree().create_timer(0.1).timeout
	if is_dragging != false: return
	
	_1s.paused = !_1s.paused


func _on_reset_pressed() -> void:
	await get_tree().create_timer(0.1).timeout
	if is_dragging != false: return
	
	if _1s.paused: _1s.paused = false
	_1s.stop()
	time = 0
	start.visible = true
	buttons.visible = false


func _on_close_pressed() -> void:
	await get_tree().create_timer(0.1).timeout
	if is_dragging != false: return
	
	queue_free()


func _on_mouse_entered() -> void:
	mouse_in = true


func _on_mouse_exited() -> void:
	mouse_in = false
