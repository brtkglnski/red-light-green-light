extends AnimatedSprite2D

# Variables to track state
var is_green_light = false
@onready var animated_sprite = self
# Signals (to communicate with the player or main scene)
signal state_changed(is_green_light)

func change_state():
	is_green_light = not is_green_light
	state_changed.emit(is_green_light)
	# Change sprite or animation based on the state
	if is_green_light:
		print("watcher activated")
		animated_sprite.frame = 1
	else:
		print("watcher disactivated")
		animated_sprite.frame = 0
