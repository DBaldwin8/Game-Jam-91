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
const WAIT_TIME: float = 2.0 
var _timer_current_time: float = 0.0 

var movement = 0 # initially not moving
var direction = "right" # For ease of readability.
@export var speed : int # Now set within inspector, default 100.
 
func _process(delta: float) -> void: # delta = time between frames, keeps speed same.
	var random_num = randf() # random number between 0 and 1 inclussive.
	if random_num < 0.1: # bottom 10% chance of standing still.
		movement = 0
	if random_num > 0.95: # top 5% chance of changing direction.
		if direction == "right":
			direction = "left"
			movement = speed * -1 # negative moves left
		elif direction == "left":
			direction = "right"
			movement = speed * 1 # Positive moves right
	#print(movement) # for console visibility of change
	position.x += movement * delta # Updates the current x axis position of npc.
	# Below is the timer function for testing the signal.
	_timer_current_time += delta
	if _timer_current_time >= WAIT_TIME:
		_timer_current_time -= WAIT_TIME
		steal_painting()
	#print(_timer_current_time) # Prints time for timer.

# Functions steal plan
# Needs to decide if it should still a painting once in range.
	# random number = chance to steal.
	# on chance needs to omit a steal signal
# Steal signal needs to be created in signal hub and called in steal function.
func steal_painting():
	SignalHub.emit_stolen_painting() # Call to emit signal.
