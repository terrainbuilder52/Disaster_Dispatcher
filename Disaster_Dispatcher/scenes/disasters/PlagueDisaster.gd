extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	hide()


func _on_World_disaster_died():
	hide()
