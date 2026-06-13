extends Node

var version: String = "b1.1"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

func hidden(hidden: bool = true):
	var main: Node = get_parent()
	var unhide: Window = preload("res://widget/unhide.tscn").instantiate()
	match hidden:
		true:
			for child in main.get_children(false):
				if child.name != "Global":
					child.hide()
			add_sibling(unhide)
		
		false:
			for child in main.get_children(false):
				if child.name != "Global":
					child.show()

func quit(code: int, text: String):
	print(text)
	get_tree().quit(code)
