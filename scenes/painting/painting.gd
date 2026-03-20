extends Node2D
class_name Painting

@export var paintings: Array[Texture2D]
@onready var sprite_2d: Sprite2D = $Sprite2D


func _ready() -> void:
	var rand_pi = randi() % paintings.size()
	sprite_2d.texture = paintings[rand_pi]
