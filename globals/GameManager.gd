extends Node

# Autoload singleton; 
# tracks and mutates game state only
# (stolen count, wrong arrests, active thief reference).


func _ready() -> void:
	SignalHub.stolen_painting.connect(painting_stolen_confirmation)
	# Needs the function to be referenced when signal is omitted.

func painting_stolen_confirmation():
	print("CAN CONFIRM")
