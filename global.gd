extends Node

var hidden : bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func quit(code: int, text: String):
	print(text)
	get_tree().quit(code)
