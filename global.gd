extends Node

var version: String = "b1.1"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

func hidden(hide: bool = true) -> void:
	var main: Node = get_parent()
	var unhide: Window = preload("res://widget/unhide.tscn").instantiate()
	match hide:
		true:
			for child in main.get_children(false):
				if child.name != "Global" and child.name != "Config":
					child.hide()
			add_sibling(unhide)
		
		false:
			for child in main.get_children(false):
				if child.name != "Global" and child.name != "Config":
					child.show()

func quit(code: int, text: String):
	print(text)
	get_tree().quit(code)
