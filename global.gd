extends Node

var version: String = "b1"
var version_string: String

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	version_string = "[b]Version[/b] : [color=blue][url=https://github.com/Stenium112/Catssroom/releases/tag/" + Global.version + "]" + Global.version + "[/url][/color]"

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
