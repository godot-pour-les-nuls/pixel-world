extends Node

func _ready():
	$HUD/MarginContainer/VBoxContainer/Title/AnimationPlayer.play("Bouncing Title")

func _on_StartButton_pressed():
	Sfx.play_click()
	get_tree().change_scene("res://stages/one/StageOne.tscn")

func _on_ExitButton_pressed():
	Sfx.play_click()
	get_tree().quit()
