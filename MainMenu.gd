extends Node

func _on_StartButton_pressed():
	get_tree().change_scene("res://StageOne.tscn")

func _on_OptionsButton_pressed():
	get_tree().change_scene("res://Options.tscn")

func _on_ExitButton_pressed():
	get_tree().quit()
