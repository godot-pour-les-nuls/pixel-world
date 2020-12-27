extends Area2D

const SPEED = 150

var velocity = Vector2()
var direction = 1

func set_fireball_direction(dir):
	direction = dir
	if dir == -1:
		$AnimatedSprite.flip_h = true
		$CollisionShape2D.position.x = -$CollisionShape2D.position.x
		$VisibilityNotifier2D.position.x = -$VisibilityNotifier2D.position.x

func _physics_process(delta):
	velocity.x = SPEED * delta * direction
	translate(velocity)
	$AnimatedSprite.play("shoot")

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()

func _on_Fireball_body_entered(body):
	queue_free()
