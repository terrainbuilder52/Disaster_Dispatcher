extends Node

var time = 0
var time_passed = 15
var turn = 0
signal turn_passed
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	time += 1
	if time > time_passed:
		time = 0
		turn += 1
		_on_Turn_passed()
	$WorldUI/StatsLabels/TurnLabel.text = "Turn: " + str(turn)


func _on_Turn_passed():
		emit_signal("turn_passed")

