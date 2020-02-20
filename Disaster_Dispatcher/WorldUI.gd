extends Control

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var city_scene = get_parent().get_node("City")
	var upgrade_cost = city_scene.get("city_upgrade_cost")
	var city_level = city_scene.get("city_level")
	var max_city_level = city_scene.get("max_city_level")
	if city_level == max_city_level:
		$ActionMenu/VSplitContainer/VBoxContainer/UpgradeCityButton.text = "MAXED"
		
	if city_level != max_city_level:
		$ActionMenu/VSplitContainer/VBoxContainer/CostLabel.text = "Cost: " + str(upgrade_cost)
	else:
		$ActionMenu/VSplitContainer/VBoxContainer/CostLabel.text = "MAXED"

			
