extends Node2D

var gold = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_World_turn_passed():
	gold += 10
	var main_scene = get_parent()
	main_scene.get_node("WorldUI/CanvasLayer/GoldLabel").text = "Gold: " + str(gold)
	
