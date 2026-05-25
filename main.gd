extends Node

@onready var barre: Panel = $Barre

func _ready() -> void:
	set_mouse_passthrough(get_children())

func set_mouse_passthrough(nodes: Array[Node]):
	var region: PackedVector2Array = []
	for node in nodes:
		if node is Panel:
			var real_size: Vector2 = node.size * node.scale
			var global_pos: Vector2 = node.global_position
			
			
			region.insert(0, global_pos)
			region.insert(0, Vector2(global_pos.x + real_size.x, global_pos.y))
			region.insert(0, global_pos + real_size)
			region.insert(0, Vector2(global_pos.x, global_pos.y + real_size.y))
			
	
	$Polygon2D.polygon = region
	DisplayServer.window_set_mouse_passthrough(region)
	print(region)
