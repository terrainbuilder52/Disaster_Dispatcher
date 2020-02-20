extends Node
var time = 0
var time_passed = 1
var turn = 0
var game_round = 0

var disaster_list = []
var disasters_list = ["CLEAR", "FIRE"]
signal turn_passed

var start_game = false

# Called when the node enters the scene tree for the first time.
func _ready():
	disaster_generation()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if start_game:
		time += 1
		if time > time_passed:

			if disasters_list[0] in disaster_list[turn]:
				pass
			elif disasters_list[1] in disaster_list[turn]:
				pass

			#NEXT TURN LOGIC
			time = 0
			turn += 1
			_on_Turn_passed()
			
	$WorldUI/StatsLabels/VBoxContainer/TurnLabel.text = "Turn: " + str(turn)
	$WorldUI/StatsLabels/VBoxContainer/RoundLabel.text = "Round: " + str(game_round)
	
	#Restart Turn
	if turn >= 100:
		turn = 0
		start_game = false
		game_round += 1
		disaster_list.clear()
		disaster_generation()

func _on_Turn_passed():
		emit_signal("turn_passed")

func _on_StartGameButton_pressed():
	start_game = true
	
func disaster_generation():
	#Generate disaster map
	for i in range(100):
		disaster_list.append(disasters_list[int(rand_range(0, disasters_list.size()))])

		
		
