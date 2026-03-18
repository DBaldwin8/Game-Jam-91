extends CharacterBody2D
@onready var timer: Timer = $Timer

# add move_and_slide() from tut for movement.

##Walking needs to be called here in a _process()
# random number multiplied up to change the x position
var movement = 0
var direction = "right"
var speed = 100

func _process(delta: float) -> void:
#func _on_timer_timeout() -> void:
	var random_num = randf()
	#print(random_num)
	if random_num < 0.1:
		movement = 0
	if random_num > 0.9:
		if direction == "right":
			direction = "left"
			movement = speed * -1
		elif direction == "left":
			direction = "right"
			movement = speed * 1
	print(movement)
	position.x += movement * delta
	
	
	
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
