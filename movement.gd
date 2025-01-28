extends CharacterBody2D

@export var speed = 100 
@onready var animated_sprite = $CollisionShape2D/AnimatedSprite2D 
func get_input():
	var input_direction = Input.get_vector("left", "right", "up", "down")
	velocity = input_direction * speed

func _physics_process(delta):
	get_input()
	move_and_slide()

	if velocity.y != 0:  
		play_animation("walk") 
	else:
		stop_animation()

func play_animation(animation_name: String):
	if not animated_sprite.is_playing():
		animated_sprite.play(animation_name)

func stop_animation():
	if animated_sprite.is_playing():
		animated_sprite.stop()
