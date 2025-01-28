extends AnimatedSprite2D

var is_green_light = false
@onready var animated_sprite = self
@onready var countdown = $waitSoundEffect

signal state_changed(is_green_light)

func is_light_green() -> bool:
	return is_green_light
	
func change_state():
	is_green_light = not is_green_light
	state_changed.emit(is_green_light)

	if is_green_light:
		animated_sprite.frame = 1
	else:
		animated_sprite.frame = 0
		countdown.play()
