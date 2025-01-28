extends Node2D

# References to other nodes
@onready var player = $Player
@onready var watcher = $Watcher
@onready var timer = $Timer
@onready var goal = $Goal
#@onready var ui_label = $UI/Label

# Game state variables
var game_running = true
var player_is_moving = false
func _ready():
	# Start the timer for green/red light
	timer.start()
	print("ready function activated")
	print("Player Collision Layer: ", player.collision_layer)
	print("Player Collision Mask: ", player.collision_mask)
	print("Goal Collision Layer: ", goal.collision_layer)
	print("Goal Collision Mask: ", goal.collision_mask)
	print("Player position: ", player.global_position)
	print("Goal position: ", goal.global_position)

func _on_timer_timeout():
	print("timer timeout function activated")
	if game_running:
		watcher.change_state()

func _on_watcher_state_changed(is_green_light):
	print("on watcher state changed function activated")
	if not is_green_light and player_is_moving:
		game_over()

func game_over():
	print("game over function activated")
	game_running = false
	#ui_label.text = "Game Over! You moved during red light!"
	timer.stop()

func _on_goal_area_entered(p):
	# Check if the player reaches the goal
	print("on goal area entered")
	if game_running:
		print("you won")
		game_running = false
		#ui_label.text = "You Win!"
		timer.stop()
