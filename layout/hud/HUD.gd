extends CanvasLayer

var chests = 0
var deaths = 0

onready var player_dash_cooldown = get_parent().get_node("Player/DashCooldown")
onready var dash_cooldown_texture = $MarginContainer/VBoxContainer/HBoxContainer/DashCooldown/VBoxContainer/TextureProgress
onready var deaths_counter_number = $MarginContainer/VBoxContainer/HBoxContainer/Counters/VBoxContainer/DeathsCounter/Number
onready var chests_counter_number = $MarginContainer/VBoxContainer/HBoxContainer/Counters/VBoxContainer/ChestsCounter/Number

func _ready():
	var chests = get_tree().get_nodes_in_group("chest")
	for chest in chests:
		chest.connect("chest_collected", self, "_on_Chest_collected")

func _physics_process(delta):
	update_dash_cooldown_hud()

func _on_Chest_collected():
	chests += 1
	chests_counter_number.text = String(chests)

func _on_Player_died():
	deaths += 1
	deaths_counter_number.text = String(deaths)

func update_dash_cooldown_hud():
	var waitTime = player_dash_cooldown.get_wait_time()
	var timeLeft = player_dash_cooldown.get_time_left()
	var timeLeftValue = (1 - (timeLeft / waitTime)) * 100
	dash_cooldown_texture.value = timeLeftValue
