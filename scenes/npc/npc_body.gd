extends CharacterBody2D
class_name Npc
@onready var timer: Timer = $Timer

# DONE - Walking needs to be called here in a _process()
# PLAN CHANGED - random number multiplied up to change the x position
# NEW PLAN DONE - using a set speed * delta.
# Done - NPC types
# DONE - Function to assign NPC TYPE, in a _ready function, NOTE NO LONGER DONE IN _READY
#TODO - Steal function
	   #|- DONE Should emit signal for stealing on the signal hub.
	   #|- DONE Game manager recieves signal
	   #|- Done Game manager should recieve signal and change art/stolen count,
			# DONE Game manager dictionary of STATE.
			# DONE Adds to stolen count.
			# DONE emit should be called from signal hub.
			# DONE After stealing had to exit. RANOM left or right.
	   #|- TODO Only if in area chance to steal paintings.
		# TODO Needs to pass painting? NOTE future.

# IMPORTANT TODO ADD COMMENTS TO NEW CODE.

var movement = 0 # initially not moving
var direction = "right" # For ease of readability.
## The pixels per a draw that NPCs move. Suggested 200
@export var npc_speed : int 
## Chance float in 100. Suggested 0.05
@export var chance_of_steal : float
## Chance from 0 to float. Suggested 0.1.
@export var chance_to_stand_still : float
## Chance from float to 1. Suggested 0.95.
@export var chance_to_change_direction_upper : float
## enter as thief, visitor or guard
@export var npc_type : String

var heist_target = 1
var escaping = false

func _process(delta: float) -> void: # delta = time between frames, keeps speed same.
	if !escaping :
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
	
	if npc_type == "thief" && self.movement == 0 && $Timer.is_stopped() :
		var random_steal_num = randi_range(0,100)
		if random_steal_num < chance_of_steal:
			steal_painting()
			heist_target -= 1
			if heist_target <= 0:
				escape()
			else:
				$Timer.start()
# NEEDS TO PASS PAINTING LATER ON.

func escape():
	escaping = true
	var random_escape_direction = 0.5
	movement = npc_speed * +1 if random_escape_direction < 0.5 else npc_speed * -1

func steal_painting():
	SignalHub.emit_stolen_painting() # Call to emit signal.
