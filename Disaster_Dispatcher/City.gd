extends Node2D
var gold = 0
var city_level = 0
var health = 100
var population = 100

# Called when the node enters the scene tree for the first time.
func _ready():
	var city_level = 0
	var main_scene = get_parent()
	main_scene.get_node("WorldUI/StatsLabels/VBoxContainer/GoldLabel").text = "Gold: " + str(gold)
	main_scene.get_node("WorldUI/StatsLabels/VBoxContainer/CityLevelLabel").text = "City Level: " + str(city_level)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var main_scene = get_parent()
	main_scene.get_node("WorldUI/StatsLabels/VBoxContainer/GoldLabel").text = "Gold: " + str(gold)
	main_scene.get_node("WorldUI/StatsLabels/VBoxContainer/CityLevelLabel").text = "City Level: " + str(city_level)

#Passive Gold generation
func _on_World_turn_passed():
	gold += 10
	
#When the upgrade city button is pressed, the amount of gold is withdrawn and an upgrade level is added.
func _on_Button_pressed():
	if city_level != 3:
		if gold >= 100:
			gold -= 100
			city_level += 1
			
			print(city_level)
			
	
