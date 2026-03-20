extends Node2D # Extending root node class
class_name Painting # My own class
# So i can create method and stats to use on it

# on scene load -> use this array of pictures(set in right inspector from root node selection)
@export var paintings: Array[Texture2D]
# on scene load -> get ref to the sprite to put pictures on it
@onready var sprite_2d: Sprite2D = $Sprite2D

# on scene initilisation
func _ready() -> void:
	# get rand picture_index(pi) <- rand int modulo size of array
	var rand_pi = randi() % paintings.size()
	# set the sprite texture to the rand painting
	sprite_2d.texture = paintings[rand_pi]


# TODO
# - Create separate @export array for frames, pictures
# - Create new spite2D node in scene tree
# - place new sprite2d ontop of painting sprite2d
# - Create new ref to sprite2d in script
# - create new rand_fi(random fram index)
# - set the new sprite2d node texture to the random frame
