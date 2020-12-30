extends Node

func _ready():
	$HUD/MarginContainer/VBoxContainer/Title/AnimationPlayer.play("Bouncing Title")

func _on_StartButton_pressed():
	Sound.play_click()
	get_tree().change_scene("res://StageOne.tscn")

func _on_ExitButton_pressed():
	Sound.play_click()
	get_tree().quit()
