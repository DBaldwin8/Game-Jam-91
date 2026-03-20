extends Node

# Autoload singleton; 
# tracks and mutates game state only
# (stolen count, wrong arrests, active thief reference).


func _ready() -> void:
	SignalHub.stolen_painting.connect() 
	# Needs the function to be called when signal is omitted
