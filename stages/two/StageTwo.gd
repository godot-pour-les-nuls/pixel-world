extends Node2D

var total_chests = 0
var chests = 0

func _ready():
	var chests = get_tree().get_nodes_in_group("chest")
	total_chests = chests.size()
	for chest in chests:
		chest.connect("chest_collected", self, "_on_Chest_collected")

func _on_Chest_collected():
	chests += 1
	if chests == total_chests:
		get_tree().change_scene("res:///stages/victory/VictoryScreen.tscn")

func _on_Player_died():
	$Player.respawn(168, 112)
