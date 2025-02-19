extends Label
var coins = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	text = str(coins)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_coin_silver_coin_collected():
	coins = coins + 10
	_ready()
