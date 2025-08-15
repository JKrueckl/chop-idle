extends Node2D

const WOOD_SCENE = preload("res://scenes/WoodPiece.tscn")
const SPAWN_INTERVAL = 0.5
var spawn_timer = 0.0

func _process(delta):
	spawn_timer += delta
	if spawn_timer > SPAWN_INTERVAL:
		spawn_timer = 0.0
		spawn_wood()

func spawn_wood():
	var wood = WOOD_SCENE.instantiate()
	wood.position = Vector2(randf_range(0, get_viewport_rect().size.x), -32)
	add_child(wood)
