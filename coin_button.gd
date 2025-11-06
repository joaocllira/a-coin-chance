extends TextureButton

@export var coin_number: int = 0;
signal select_coin(coin_number: int)


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pressed.connect(_on_pressed)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_pressed() -> void:
	emit_signal("select_coin", coin_number)
