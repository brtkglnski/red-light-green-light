extends Node2D

# References to other nodes
@onready var player = $Player
@onready var watcher = $Watcher
@onready var timer = $Timer
@onready var goal = $Goal
@onready var successScreen = $SuccessScreen
@onready var eliminatedScreen = $eliminatedScreen
@onready var SpawnLocation = $SpawnLocation

# Game state variables
var game_running = true
func _ready():
	# Start the timer for green/red light
	timer.start()
	print("ready function activated")

func _on_timer_timeout():
	print("timer timeout function activated")
	if game_running:
		watcher.change_state()


func _physics_process(delta):
	if game_running:
		while watcher.is_light_green():
			if Input.is_action_pressed("up"):
				game_over()
				break
			else:
				break
			
func game_over():
	print("game over function activated")
	game_running = false
	player.set_physics_process(false)
	player.stop_animation()
	player.play_animation("death") 
	eliminatedScreen.visible = true
	timer.stop()

func _on_goal_area_entered(p):
	print("on goal area entered")
	if game_running:
		print("you won")
		watcher.countdown.stop()
		game_running = false
		player.set_physics_process(false)
		player.stop_animation()
		successScreen.visible = true
		timer.stop()


func _on_button_pressed() -> void:
	player.global_position = SpawnLocation.global_position
	player.set_physics_process(true)
	game_running = true
	eliminatedScreen.visible = false
	successScreen.visible = false
	player.play_animation("walk")
	if watcher.is_light_green():
		watcher.change_state()
	if not watcher.is_light_green():
		watcher.countdown.play()
	timer.start()


func _on_goal_body_entered(body: Node2D) -> void:
	pass # Replace with function body.
