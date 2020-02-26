extends Node

var fire_dis = preload("res://scenes/Disasters.tscn")
var time = 0
var time_passed = 2
var turn = 0
var max_turn = 100
var game_round = 1

var disaster_list = []
var disasters_list = [
	"CLEAR", "FIRE", "CLEAR", "FLOOD", "CLEAR", "TORNADO", "CLEAR", "RAINBOW", "MONSTER", "PlAGUE"]

signal clear_disaster
signal fire_disaster
signal turn_passed

var start_game = false

# Called when the node enters the scene tree for the first time.
func _ready():
	disaster_generation(max_turn)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if start_game:
		time += 1
		if time > time_passed:
			disaster_logic(turn)
			
			#NEXT TURN LOGIC
			time = 0
			turn += 1
			_on_Turn_passed()
			
	$WorldUI/StatsLabels/VBoxContainer/TurnLabel.text = "Turn: " + str(turn)
	$WorldUI/StatsLabels/VBoxContainer/RoundLabel.text = "Round: " + str(game_round)
	
	if start_game == false:
		$WorldUI/StartGameButton.text = "RUN"
	elif start_game == true:
		$WorldUI/StartGameButton.text = "RUNNING"
		
	#Restart Turn
	if turn >= max_turn:
		turn = 0
		start_game = false
		game_round += 1
		disaster_list.clear()
		disaster_generation(max_turn)
		
func disaster_generation(round_length):
	#Generate disaster map
	for i in range(round_length):
		if i <= 10:
			disaster_list.append(disasters_list[0])
		elif i > 10:
			disaster_list.append(disasters_list[int(rand_range(0, min(game_round, disasters_list.size())))])
		else:
			disaster_list.append(disasters_list[0])
			
	print(disaster_list)
	
func disaster_logic(turn):
	if disasters_list[0] in disaster_list[turn]: # Clear day
		emit_signal("clear_disaster")
		time_passed = 4
	elif disasters_list[1] in disaster_list[turn]: # Fire
		emit_signal("fire_disaster")
		var fire = fire_dis.instance()
		add_child(fire)
		time_passed = 120

# SIGNAL FUNCTIONS	
func _on_City_has_died():
	get_tree().change_scene("res://scenes/EndScreen.tscn")

func _on_Turn_passed():
	emit_signal("turn_passed")
		
func _on_StartGameButton_pressed():
	start_game = true
			
