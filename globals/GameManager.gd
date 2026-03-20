extends Node

# Autoload singleton; 
# tracks and mutates game state only
# (stolen count, wrong arrests, active thief reference).

var CONFIG = {
	"galaries" = 0,
	"paintings" = 0,
	"thieves" = 0,
	"visitors" = 0,
	"max wrong arrests" = 0,
	"max stolen painting" = 0
}

var STATE = {
	"stolen" = 0,
	"wrong arrests" = 0
}

func _ready() -> void:
	SignalHub.stolen_painting.connect(painting_stolen_confirmation)
	# Needs the function to be referenced when signal is omitted.

func painting_stolen_confirmation(): #Function to react to the signal
	#print("CAN CONFIRM")
	pass
