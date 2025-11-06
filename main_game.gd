extends Node

var selected_array: Array = []
var player_score: int = 0
var machine_score: int = 0
var next_probability: int = 0


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$GridContainer/CoinButton.select_coin.connect(selectCoin);
	$GridContainer/CoinButton2.select_coin.connect(selectCoin);
	$GridContainer/CoinButton3.select_coin.connect(selectCoin);
	$GridContainer/CoinButton4.select_coin.connect(selectCoin);


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func selectCoin(value: int) -> void:
	if (selected_array.has(value)):
		selected_array.erase(value)
	elif (selected_array.size() < 3):
		selected_array.push_front(value)
	selected_array.sort()
	next_probability = selected_array.size() * 25
	print(selected_array)
	print(next_probability, "%")


func produce_text_label() -> String:
	return """
	SELECIONADOS: {selected_array} 
	PRÓXIMA PROBABILIDADE: {next_probability} %
	----------------------
	Jogador: {player_score}
	Máquina: {machine_score}
	""".format({
		"selected_array": selected_array, 
		"next_probability": next_probability, 
		"player_score": player_score,
		"machine_score": machine_score
	})


func _on_go_button_pressed() -> void:
	var go_number = randi_range(1, 4)
	if (selected_array.has(go_number)):
		player_score += 25 * (4 - selected_array.size())
	else:
		machine_score += 25 * selected_array.size()
	print("player_score", player_score)
	print("machine_score", player_score)
	selected_array = []
	next_probability = 0
