extends CharacterBody2D
#@onready var timer: Timer = $Timer
# ^ Not currently needed.

# DONE - Walking needs to be called here in a _process()
# PLAN CHANGED - random number multiplied up to change the x position
# NEW PLAN DONE - using a set speed * delta.
# DONE AS ARRAY - NPC types
# TODO - Steal function

const NPC_TYPE = [
	"visitor",
	"guard",
	"thief"
]
var movement = 0 # initially not moving
var direction = "right" # For ease of readability.
var speed = 100 # Adjust speed here 100 px later multiplied by delta.
 
func _process(delta: float) -> void: # delta = time between frames, keeps speed same.
#func _on_timer_timeout() -> void:
	var random_num = randf() # random number between 0 and 1 inclussive.
	if random_num < 0.1: # bottom 10% chance of standing still.
		movement = 0
	if random_num > 0.95: # top 10% chance of changing direction.
		if direction == "right":
			direction = "left"
			movement = speed * -1 # negative moves left
		elif direction == "left":
			direction = "right"
			movement = speed * 1 # Positive moves right
	#print(movement) # for console visibility of change
	position.x += movement * delta # Updates the current x axis position of npc.












# Below was the old plan of using timer which I moved away from
# Code kept until
	#if random_num > 0.98:
		##position.x += 1000 * _current_delta
		#position.x = move_toward(position.x, position.x+500, _current_delta*100)
		#print(position.x)
	#elif random_num > 0.96:
		##position.x -= 1000 * _current_delta
		#position.x = move_toward(position.x, position.x-500, _current_delta*100)
		#print(position.x)
	#else:
		#pass
	#timer.start()
# If randomNum > 0.1 change direction
# else change directions
#func changeDirection():
	#var speed = 10
	#var direction = 0
	#if random_num > 0.9:
		#if direction >= 0:
			#direction = speed * _current_delta * 1
		#if direction < 0:
			#direction = speed * _current_delta * -1
	#position.x = direction
