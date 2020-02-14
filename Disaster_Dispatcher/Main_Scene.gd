extends Node

var time = 0
var time_passed = 60
var turn = 0
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	time += 1
	if time > time_passed:
		time = 0
		turn += 1
	$WorldUI/CanvasLayer/TurnLabel.text = str(turn)
