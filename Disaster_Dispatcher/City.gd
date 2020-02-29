extends Node2D

var city_level_1 = preload("res://assets/city/city.png")
var city_level_2 = preload("res://assets/city/city2.png")
var city_level_3 = preload("res://assets/city/city3.png")

var gold = 0
var city_level = 1
var max_city_level = 4
var health = 250
var max_health = 250
var population = 250
var max_population = 250

var city_upgrade_cost

signal has_died
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
	
	# Clamp health
	health = clamp(health, 0, max_health)
	
	# Clamp Gold
	if gold < 0:
		gold = 0
	
	#Calculate cost of city upgrade
	city_upgrade_cost = 1000 * city_level
	
	#Check city health and population
	if health <= 0 or population <= 0:
		emit_signal("has_died")
		
#Passive Gold generation
func _on_World_turn_passed():
	gold += 10
	
#When the upgrade city button is pressed, the amount of gold is withdrawn and an upgrade level is added.
func _on_UpgradeCityButton_pressed():
	if city_level != max_city_level:
		if gold >= city_upgrade_cost:
			#Change stats
			gold -= city_upgrade_cost
			max_health += 100
			max_population += 100
			city_level += 1
	
	if city_level == 2:
		$Sprite.texture = city_level_2
	elif city_level == 3:
		$Sprite.texture = city_level_3
		
func _on_RepairCityButton_pressed():
	if health != max_health:
		if gold >= 100:
			health += 20
			gold -= 100

# DISASTERS
func _on_World_fire_disaster():
	health -= 4

func _on_World_flood_disaster():
	health -= 10
	population -= 10

func _on_World_plague_disaster():
	population -= 25

func _on_World_tornado_disaster():
	health -= 30
	population -= 10
	
func _on_World_monster_disaster():
	health -= 60
	population -= 60


func _on_World_rainbow_disaster():
	health -= 100
	population -= 100
