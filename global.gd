extends Node

var version: String = "b1"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func hidden(hidden: bool = true):
	var main: Node = get_parent().get_child(-1)
	var unhide: Window = preload("res://widget/unhide.tscn").instantiate()
	match hidden:
		true:
			for child in main.get_children(false):
				child.hide()
			add_sibling(unhide)
		
		false:
			for child: Window in main.get_children(false):
				child.show()

func quit(code: int, text: String):
	print(text)
	get_tree().quit(code)
