extends Node2D
var gold = 0
var city_level = 1
var max_city_level = 4
var health = 100
var population = 100

var city_upgrade_cost
# Called when the node enters the scene tree for the first time.
#Sets Labels
func _ready():
	var city_level = 0
	var main_scene = get_parent()
	main_scene.get_node("WorldUI/StatsLabels/VBoxContainer/GoldLabel").text = "Gold: " + str(gold)
	main_scene.get_node("WorldUI/StatsLabels/VBoxContainer/CityLevelLabel").text = "City Level: " + str(city_level)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#Updates Labels
func _process(delta):
	var main_scene = get_parent()
	main_scene.get_node("WorldUI/StatsLabels/VBoxContainer/GoldLabel").text = "Gold: " + str(gold)
	main_scene.get_node("WorldUI/StatsLabels/VBoxContainer/CityLevelLabel").text = "City Level: " + str(city_level)
	main_scene.get_node("WorldUI/StatsLabels/VBoxContainer/HealthLabel").text = "HP: " + str(health)
	main_scene.get_node("WorldUI/StatsLabels/VBoxContainer/PopulationLabel").text = "Pop: " + str(population)
	
	if city_level >= max_city_level:
		$"../WorldUI/ActionMenu".hide()
	
	city_upgrade_cost = int(pow(100, log(city_level * 2)))
#Passive Gold generation
func _on_World_turn_passed():
	gold += 10
	
#When the upgrade city button is pressed, the amount of gold is withdrawn and an upgrade level is added.
func _on_UpgradeCityButton_pressed():
	if city_level != max_city_level:
		if gold >= city_upgrade_cost:
			#Change stats
			gold -= city_upgrade_cost
			health += 100
			population += 100
			city_level += 1
