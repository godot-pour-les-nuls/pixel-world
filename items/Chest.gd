extends Area2D

signal chest_collected

var isOpened = false

func _ready():
	$AnimatedSprite.play("closed")

func _on_Chest_body_entered(body):
	if isOpened == false:
		isOpened = true
		$AnimationPlayer.play("bounce")
		Sfx.play_collect()
		emit_signal("chest_collected")
		
func _on_AnimationPlayer_animation_finished(anim_name):
	$AnimatedSprite.play("opening")
	
func _on_AnimatedSprite_animation_finished():
	if isOpened:
		$AnimatedSprite.play("opened")
