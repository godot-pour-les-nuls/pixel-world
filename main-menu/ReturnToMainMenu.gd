extends TextureButton

func _on_TextureButton_pressed():
	get_tree().change_scene("res://main-menu/MainMenu.tscn")
