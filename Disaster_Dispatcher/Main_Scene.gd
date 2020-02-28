extends Node

var time = 0
var time_passed = 1
var turn = 0
var max_turn = 100
var game_round = 1

var disaster_list = []
var disasters_list = [
	"CLEAR", "FIRE", "FLOOD", "PlAGUE", "TORNADO" , "MONSTER", "RAINBOW"]

signal clear_disaster
signal fire_disaster
signal flood_disaster
signal tornado_disaster
signal monster_disaster
signal rainbow_disaster
signal turn_passed
signal disaster_died

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
		disaster_list.append(disasters_list[0])
		
	for i in range(int(round_length/2)):
		disaster_list[int(rand_range(0, round_length))] = (disasters_list[int(rand_range(0, min(game_round, disasters_list.size())))])
			
	print(disaster_list)
	
func disaster_logic(turn):
	emit_signal("disaster_died")
	
	if disasters_list[0] in disaster_list[turn]: # Clear day
		emit_signal("clear_disaster")
		time_passed = 1
	elif disasters_list[1] in disaster_list[turn]: # Fire
		emit_signal("fire_disaster")
		$FireDisaster.show()
		time_passed = 30
	elif disasters_list[2] in disaster_list[turn]: #Flood
		emit_signal("flood_disaster")
		$FloodDisaster.show()
		time_passed = 30

		

# SIGNAL FUNCTIONS	
func _on_City_has_died():
	get_tree().change_scene("res://scenes/EndScreen.tscn")

func _on_Turn_passed():
	emit_signal("turn_passed")
		
func _on_StartGameButton_pressed():
	start_game = true
			
