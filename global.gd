extends Node

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func hidden(hidden: bool = true):
	var node := preload("res://unhide.tscn").instantiate()
	match hidden:
		true:
			for nodes in get_node("/root/Main").get_child_count():
				get_node("/root/Main").get_child(nodes - 1).hide()
				get_node("/root/Main").add_child(node)
		
		false:
			for nodes in get_node("/root/Main").get_child_count():
				get_node("/root/Main").get_child(nodes - 1).show()

func quit(code: int, text: String):
	print(text)
	get_tree().quit(code)
