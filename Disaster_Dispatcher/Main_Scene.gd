extends Node

var time = 0
var time_passed = 15
var turn = 0
signal turn_passed

var start_game = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if start_game:
		time += 1
		if time > time_passed:
			time = 0
			turn += 1
			_on_Turn_passed()
	$WorldUI/StatsLabels/VBoxContainer/TurnLabel.text = "Turn: " + str(turn)
	if turn >= 100:
		turn = 0
		start_game = false

func _on_Turn_passed():
		emit_signal("turn_passed")

func _on_StartGameButton_pressed():
	start_game = true
