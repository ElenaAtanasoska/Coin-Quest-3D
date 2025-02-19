extends Node3D

@onready var timer = $Timer
@onready var time_label = $CanvasLayer/timeRemaining
@onready var game_over_label =  $CanvasLayer/GameOverLabel
@onready var game_finished_label = $CanvasLayer/GameFinished
var total_coins = 8  # Set the total number of coins in your game
var collected_coins = 0  # Tracks how many coins are collected

func _ready() -> void:
	game_over_label.visible = false  # Hide game over message
	game_finished_label.visible = false  # Hide game finished message
	timer.timeout.connect(_on_timer_timeout)  # Connect the timer event

func _process(delta: float) -> void:
	time_label.text = "Time Left: %s" % roundf(timer.time_left)

func increase_score():
	collected_coins += 1
	update_score_label()

	# Check if all coins are collected
	if collected_coins >= total_coins:
		game_finished()

func _on_timer_timeout() -> void:
	if collected_coins < total_coins:
		game_over()  # Timer ran out without collecting all coins

func game_finished():
	game_finished_label.visible = true  # Show "Game Finished" message
	time_label.visible = false  # Hide the timer
	get_tree().paused = true  # Pause the game (optional)
	timer.stop()  # Stop the timer

func game_over():
	game_over_label.visible = true  # Show "Game Over" message
	time_label.visible = false  # Hide the timer
	get_tree().paused = true  # Pause the game (optional)
	timer.stop()  # Stop the timer

func update_score_label():
	# Update score label if necessary
	# Assuming you have a score label, you can update it here
	pass
