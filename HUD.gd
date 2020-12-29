extends CanvasLayer

var chests = 0
var total_chests = 0
var deaths = 0

onready var player_dash_cooldown = get_parent().get_node("Player/DashCooldown")

func _ready():
	var chests = get_tree().get_nodes_in_group("chest")
	total_chests = chests.size()
	for chest in chests:
		chest.connect("chest_collected", self, "_on_Chest_collected")

func _physics_process(delta):
	update_dash_cooldown_hud()

func _on_Chest_collected():
	chests += 1
	$ChestsCounter/HBoxContainer/Number.text = String(chests)
	if chests == total_chests:
		get_tree().change_scene("res://VictoryScreen.tscn")

func _on_Player_died():
	deaths += 1
	$DeathsCounter/HBoxContainer/Number.text = String(deaths)

func update_dash_cooldown_hud():
	var waitTime = player_dash_cooldown.get_wait_time()
	var timeLeft = player_dash_cooldown.get_time_left()
	var timeLeftValue = (1 - (timeLeft / waitTime)) * 100
	$DashInterface/TextureProgress.value = timeLeftValue