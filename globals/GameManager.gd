extends Node

# Autoload singleton; 
# tracks and mutates game state only
# (stolen count, wrong arrests, active thief reference).

var config = {
	"galaries" = 0,
	"paintings" = 0,
	"thieves" = 0,
	"visitors" = 0,
	"max wrong arrests" = 0,
	"max stolen painting" = 0
}

var state = {
	"stolen" = 0,
	"wrong arrests" = 0
}

func _ready() -> void:
	SignalHub.stolen_painting.connect(painting_stolen)
	# Needs the function to be referenced when signal is emitted.

func painting_stolen(): #Function to react to the signal
	state.stolen += 1
	print(state.stolen)
	print("CAN CONFIRM")
