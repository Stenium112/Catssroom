extends VBoxContainer

func re_adjust_child() -> void:
	
	var array: Array
	
	for child in get_children(false):
		array.insert(0, child.size.x)
	
	array.sort()
	if array.back() <= 500.0: size.x = 500.0
	else: size.x = array.back()
