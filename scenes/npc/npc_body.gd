extends CharacterBody2D
@onready var timer: Timer = $Timer

# add move_and_slide() from tut for movement.

# Walking needs to be called here in a _process()
# random number multiplied up to change the x position

func _on_timer_timeout() -> void:
	var random_num = randf()
	if random_num > 0.5:
		position.x += 50
		print(position.x)
	else:
		position.x -= 50
		print(position.x)
	timer.start()
