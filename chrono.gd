extends Panel

@onready var label: Label = $Label
@onready var _1s: Timer = $"1s"

var time : float = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	arrange_string(time)


func arrange_string(_time: float) -> void:
	var dict: Dictionary = convert_time(_time)
	var array: Array = [str(dict["Hours"]), str(dict["Minutes"]), str(dict["Seconds"])]
	label.text = ":".join(array) + str(_time).right(2)
	


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
	_1s.start()
	print("1")
