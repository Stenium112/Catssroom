extends Node

@onready var barre: Panel = $Barre

#func _ready() -> void:
	##set_mouse_passthrough(get_children())

func _process(delta: float) -> void:
	DisplayServer.window_set_mouse_passthrough(calculate_mouse_passthrough_region())
	$Polygon2D.polygon = calculate_mouse_passthrough_region()

func set_mouse_passthrough(nodes: Array[Node]):
	var region: PackedVector2Array = []
	for node in nodes:
		if node is Panel:
			var node_polygon: PackedVector2Array = node.get_child(-1).polygon
			var global_pos_region: PackedVector2Array = [node.global_position, node.global_position, node.global_position, node.global_position]
			
			var node_polygon_final: PackedVector2Array = [
				node_polygon.get(0) + global_pos_region.get(0), 
				node_polygon.get(1) + global_pos_region.get(1), 
				node_polygon.get(2) + global_pos_region.get(2),
				node_polygon.get(3) + global_pos_region.get(3)
				]
			
			region.append_array(node_polygon_final)
			
			
			
			
			#var real_size: Vector2 = node.size * node.scale
			#var global_pos: Vector2 = node.global_position
			#
			#region.insert(0, global_pos)
			#region.insert(0, Vector2(global_pos.x + real_size.x, global_pos.y))
			#region.insert(0, global_pos + real_size)
			#region.insert(0, Vector2(global_pos.x, global_pos.y + real_size.y))
			
	
	$Polygon2D.polygon = region
	DisplayServer.window_set_mouse_passthrough(region)
	print(region)

func calculate_mouse_passthrough_region() -> PackedVector2Array:
	var region := PackedVector2Array()
	var viewport := get_viewport()

	for child in get_children():
		if child is Panel:
			# Récupère le rectangle global de l'enfant (inclut déjà sa position/scale/rotation)
			var rect: Rect2 = child.get_rect()
			var scale: Vector2 = child.scale

			# Applique l'échelle supplémentaire (si scale != Vector2(1,1))
			#rect.position *= scale
			#rect.size *= scale

			# Convertit les 4 coins du rectangle en coordonnées de fenêtre (pixels)
			region.append(rect.position)
			region.append(rect.position + Vector2(rect.size.x, 0))
			region.append(rect.position + rect.size)
			region.append(rect.position + Vector2(0, rect.size.y))

	return region
