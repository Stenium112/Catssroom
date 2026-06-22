extends VBoxContainer

@onready var language: OptionButton = $Language/Language
@onready var language_text: RichTextLabel = $"Language/Language Text"

func re_adjust_child() -> void:
	
	language.position.x = language_text.get_total_character_count() * 18 # some magic number
	
	var array: Array
	
	for child in get_children(false):
		array.insert(0, child.size.x)
	
	array.sort()
	if array.back() <= 500.0: size.x = 500.0
	else: size.x = array.back()
