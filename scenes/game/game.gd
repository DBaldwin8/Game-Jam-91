extends Node2D
class_name Game

@onready var camera: Camera2D = $Camera2D

func _ready():
	camera.offset = get_viewport().size / 2

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_up"):
		move_camera(Vector2(0, -get_viewport().size.y))
	if event.is_action_pressed("ui_down"):
		move_camera(Vector2(0, +get_viewport().size.y))

func move_camera(offset: Vector2):
	camera.position += offset


# TODO
# - loop camera feed
# - canvaslayer modulate black screen between changes
