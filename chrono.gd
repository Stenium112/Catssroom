extends Panel

@onready var label: Label = $Label

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	arrange_string(630, 0)

func arrange_string(time: float, ms: float) -> void:
	var dict: Dictionary = convert_time(time)
	label.text = str(dict["Hours"]) + ":" + str(dict["Minutes"]) + ":" + str(dict["Seconds"])

func convert_time(seconds: int):
	var hours = int(seconds / 3600)
	var minutes = int((seconds % 3600) / 60)
	var remainingSeconds = int(seconds % 60)
	
	return {
		"Hours": hours,
		"Minutes": minutes,
		"Seconds": remainingSeconds
		}
	
