extends Control

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var city_level = get_parent().get_node("City").get("city_level")
	if city_level == 3:
		$ActionMenu/VSplitContainer/VBoxContainer/UpgradeCityButton.text = "MAXED"
			
