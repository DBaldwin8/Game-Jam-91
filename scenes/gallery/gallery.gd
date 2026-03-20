extends Node2D
class_name Gallery

@onready var left: Marker2D = $Left
@onready var right: Marker2D = $Right
@onready var collision_shape_2d: CollisionShape2D = $Area2D/CollisionShape2D
@export var max_paintings: int
@export var min_paintings_percent: float
@export var grid_size: int
const PAINTING = preload("res://scenes/painting/painting.tscn")
var paintings: Array = []

func _ready() -> void:
	spawn_paintings()

func spawn_paintings() -> void:
	# Get min & num of paintings to spawn
	var min_paintings: int = int(round(max_paintings * min_paintings_percent))
	
	# Get spawn shape
	var shape = get_shape(collision_shape_2d)
	
	# Build all valid grid points within shape
	var valid_coords: Array = []
	var x = shape.x[0] # start of width
	while x <= shape.x[1]: # end of width
		var y = shape.y[0] # start of height
		while y <= shape.y[1]: # end of height
			valid_coords.append(Vector2(x, y)) # add the valid grid snapped coord
			y += grid_size # iterate to next grid y snap
		x += grid_size # iterate to next grid x snap
	
	# Shuffle the coords list
	valid_coords.shuffle()
	
	# Clamp num of paintings to available grid points
	var max_spawn = min(max_paintings, valid_coords.size()) # cap max to available grid points
	var min_spawn = min(min_paintings, max_spawn) # ensure min never exceeds max
	var num_paintings = randi_range(min_spawn, max_spawn) # pick random amount in range
	if max_paintings > valid_coords.size():
		print("clamped max paintings to: ", max_spawn)
	print("num_paintings: ", num_paintings)
	
	# Spawn paintings at unique grid coords
	for i in num_paintings:
		var painting = PAINTING.instantiate()
		add_child(painting)
		painting.global_position = valid_coords[i]

func get_shape(CollisionShape: CollisionShape2D) -> Dictionary:
	var shape = CollisionShape.shape as RectangleShape2D
	var center = CollisionShape.global_position
	var half = shape.size / 2.0
	return {
		"x": [center.x - half.x, center.x + half.x],
		"y": [center.y - half.y, center.y + half.y]
	}
