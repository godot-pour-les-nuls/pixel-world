extends Node

onready var start_button = $MarginContainer/VBoxContainer/VBoxContainer/StartButton
onready var exit_button = $MarginContainer/VBoxContainer/VBoxContainer/ExitButton

func _ready():
	start_button.grab_focus()
	
func _physics_process(delta):
	if start_button.is_hovered():
		start_button.grab_focus()
	if exit_button.is_hovered():
		exit_button.grab_focus()

func _on_StartButton_pressed():
	get_tree().change_scene("res://StageOne.tscn")

func _on_ExitButton_pressed():
	get_tree().quit()
