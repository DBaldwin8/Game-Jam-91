extends CharacterBody2D
class_name Npc

# DONE - Walking needs to be called here in a _process()
# PLAN CHANGED - random number multiplied up to change the x position
# NEW PLAN DONE - using a set speed * delta.
# Done - NPC types
#TODO - Function to assign NPC TYPE, in a _ready function, 
#TODO - Steal function
	   #|- DONE Should emit signal for stealing on the signal hub.
	   #|- DONE Game manager recieves signal
	   #|- Game manager should recieve signal and change art/stolen count,
			# Game manager dictionary of STATE.
			# change STATE.
			# DONE emit should be called from signal hub.
	   #|- Only if in area chance to steal paintings.

const NPC_TYPE = [
	"visitor",
	"guard",
	"thief"
]
# Timer related
const WAIT_TIME: float = 1.0 
var _timer_current_time: float = 0.0 

var movement = 0 # initially not moving
var direction = "right" # For ease of readability.
## The pixels per a draw that NPCs move.
@export var npc_speed : int # Now set within inspector. Suggested 100.
## Chance from float to 1.
@export var chance_of_steal : float
## Chance from 0 to float. Suggested 0.1.
@export var chance_to_stand_still : float
## Chance from float to 1. Suggested 0.95.
@export var chance_to_change_direction_upper : float
 
func _process(delta: float) -> void: # delta = time between frames, keeps speed same.
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
	#print(movement) # for console visibility of change
	position.x += movement * delta # Updates the current x axis position of npc.
	# Below is the timer function for testing the signal.
	_timer_current_time += delta
	if _timer_current_time >= WAIT_TIME:
		_timer_current_time -= WAIT_TIME
		steal_painting()
	#print(_timer_current_time) # Prints time for timer.
	# logic for if steal painting should be called.
	if self.movement == 0 :
		var random_steal_num = randf()
		print(random_steal_num)
		if random_steal_num > chance_of_steal:
			steal_painting()
# Functions steal plan
# Needs to decide if it should still a painting once in range.
	# DONE random number = chance to steal. EXPORTED
	# DONE on chance needs to omit a steal signal
	# Add a timer so an only activate after a minimum time.
# Steal signal needs to be created in signal hub and called in steal function.
func steal_painting():
	SignalHub.emit_stolen_painting() # Call to emit signal.
