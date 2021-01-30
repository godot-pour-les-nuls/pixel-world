extends Node2D

func _ready():
	$CanvasLayer/MarginContainer/VBoxContainer1/Title/AnimationPlayer.play("floating")

func _on_StartButton_pressed():
	get_tree().change_scene("res://StageOne.tscn")

func _on_ExitButton_pressed():
	get_tree().quit()
