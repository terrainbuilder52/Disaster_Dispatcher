extends Node2D
var gold = 0
var city_level = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	var city_level = 0
	var main_scene = get_parent()
	main_scene.get_node("WorldUI/CanvasLayer/GoldLabel").text = "Gold: " + str(gold)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_World_turn_passed():
	clamp(city_level, 0, 3)
	var main_scene = get_parent()
	gold += 10
	main_scene.get_node("WorldUI/CanvasLayer/GoldLabel").text = "Gold: " + str(gold)
	


func _on_Button_pressed():
	if city_level != 3:
		if gold >= 100:
			gold -= 100
			city_level += 1
			
			print(city_level)
