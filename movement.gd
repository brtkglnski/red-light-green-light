extends CharacterBody2D

@export var speed = 30
@onready var animated_sprite = $CollisionShape2D/AnimatedSprite2D 
var player_is_moving = false
func get_input():
	var input_direction = Input.get_vector("left", "right", "up", "down")
	velocity = input_direction * speed

func _physics_process(delta):
	get_input()
	move_and_slide()

	if velocity.y != 0:  
		player_is_moving = true
		play_animation("walk") 
	else:
		player_is_moving = false
		stop_animation()

func is_player_moving() -> bool:
	return player_is_moving
	
func play_animation(animation_name: String):
	if not animated_sprite.is_playing():
		animated_sprite.play(animation_name)

func stop_animation():
	if animated_sprite.is_playing():
		animated_sprite.stop()
