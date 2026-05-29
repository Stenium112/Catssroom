extends Node

@onready var barre: Panel = $Barre

func _ready() -> void:
	set_mouse_passthrough(get_children())

func _physics_process(delta: float) -> void:
	call_deferred("set_mouse_passthrough", get_children())

func set_mouse_passthrough(nodes: Array[Node]):
	var region: PackedVector2Array = []
	for node in nodes:
		if node is Panel:
			
			var global_pos: Vector2 = Vector2(node.global_position.x * 1.651, node.global_position.y * 1.651)
			var size: Vector2 = Vector2(node.size.x / 2.41, node.size.y / 2.29)
			
			region.append(global_pos)
			region.append(Vector2(size.x + global_pos.x, global_pos.y))
			region.append(size + global_pos)
			region.append(Vector2(global_pos.x, size.y + global_pos.y))
			
	region.sort()
	
	print(region)
	$Polygon2D.polygon = region
	DisplayServer.window_set_mouse_passthrough(region)
