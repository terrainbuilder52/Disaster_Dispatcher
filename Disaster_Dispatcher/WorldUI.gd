extends Control

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# MENU
	var world = get_parent()
	var start_game = world.get("start_game")
	
	if start_game == true:
		$ActionMenu/Panel.hide()
		$MayorMenu/Panel.hide()
	else:
		$ActionMenu/Panel.show()
		$MayorMenu/Panel.show()
		
	# CITY
	var city_scene = get_parent().get_node("City")
	var upgrade_cost = city_scene.get("city_upgrade_cost")
	var city_level = city_scene.get("city_level")
	var max_city_level = city_scene.get("max_city_level")
	var city_health = city_scene.get("health")
	var city_max_health = city_scene.get("max_health")
	
	
	if city_level == max_city_level:
		$ActionMenu/Panel/HBoxContainer/UpgradeContainer/UpgradeCityButton.text = "MAXED"
		
	if city_level != max_city_level:
		$ActionMenu/Panel/HBoxContainer/UpgradeContainer/CostLabel.text = "Cost: " + str(upgrade_cost)
	else:
		$ActionMenu/Panel/HBoxContainer/UpgradeContainer/CostLabel.text = "MAXED"

			
