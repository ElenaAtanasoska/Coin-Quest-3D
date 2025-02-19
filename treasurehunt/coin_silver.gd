extends Area3D

@export var game_manager: Node
signal coinCollected

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float):
	rotate_y(deg_to_rad(100*delta))


func _on_body_entered(body):
	if body is CharacterBody3D:
		if game_manager:
			game_manager.increase_score()
		emit_signal("coinCollected")
		queue_free()
