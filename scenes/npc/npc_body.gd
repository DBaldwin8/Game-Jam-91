extends CharacterBody2D
class_name Npc
@onready var timer: Timer = $Timer

# DONE - Walking needs to be called here in a _process()
# PLAN CHANGED - random number multiplied up to change the x position
# NEW PLAN DONE - using a set speed * delta.
# Done - NPC types
# DONE - Function to assign NPC TYPE, in a _ready function, NOTE NO LONGER DONE IN _READY
#TODO - Steal function
	# DONE Should emit signal for stealing on the signal hub.
	# DONE Game manager recieves signal
	# Done Game manager should recieve signal and change art/stolen count,
		# DONE Game manager dictionary of STATE.
		# DONE Adds to stolen count.
		# DONE emit should be called from signal hub.
	# DONE After stealing had to exit. RANOM left or right.
	# TODO Only if in area chance to steal paintings.
	# TODO Needs to pass painting? NOTE future.


var movement = 0 # initially not moving
var direction = "right" # For ease of readability.
## The pixels per a draw that NPCs move. Suggested 200
@export var npc_speed : int 
## Chance from 0 to float to steal. Suggested 0.05
@export var chance_of_steal : float
## Chance from 0 to float. Suggested 0.1.
@export var chance_to_stand_still : float
## Chance from float to 1. Suggested 0.95.
@export var chance_to_change_direction_upper : float
## enter as thief, visitor or guard
@export var npc_type : String

var heist_target = 2 # number of painting a thief will attempt to steal before escaping
var escaping = false # state for if thief is currently escaping

func _process(delta: float) -> void: # delta = time between frames, keeps speed same.
	if !escaping : # escaping check, to continue the same direction.
		var random_num = randf() # random number between 0 and 1 inclussive.
		if random_num < chance_to_stand_still: 
			movement = 0
		if random_num > chance_to_change_direction_upper: # top 5% chance of changing direction.
			if direction == "right":
				direction = "left"
				movement = npc_speed * -1 # negative moves left
			elif direction == "left":
				direction = "right"
				movement = npc_speed * 1 # Positive moves right
	position.x += movement * delta # Updates the current x axis position of npc.
	
	# Condensed descending if tree to single check.
	# if the NPC is a thief, not moving and timer is 0...
	if npc_type == "thief" && self.movement == 0 && $Timer.is_stopped() :
		var random_steal_num = randf() # A random float 0-1
		if random_steal_num < chance_of_steal: # If that number is less than the chance to steal
			steal_painting() # steal painting emits signal
			heist_target -= 1 # heist target number is reduced
			if heist_target <= 0:
				escape() # if 0 RUN AWAY!
			else:
				$Timer.start() # else restart timer to steal next painting
# NEEDS TO PASS PAINTING LATER ON.

func escape():
	escaping = true # updates state which later skips default change direction behaviour 
	var random_escape_direction = 0.5 # chance of which direction always 50/50
	movement = npc_speed * +1 if random_escape_direction < 0.5 else npc_speed * -1
	# This movement speed is set and continues until thief escapes.
func steal_painting():
	SignalHub.emit_stolen_painting() # Call to emit signal.
