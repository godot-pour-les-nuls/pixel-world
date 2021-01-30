extends KinematicBody2D

const GRAVITY = 10
const WALK_SPEED = 30
const FLOOR = Vector2(0, -1)

var velocity = Vector2()
var direction = 1
var is_dead = false

func kill():
	is_dead = true
	$AnimatedSprite.play("dead")
	$RemoveDeadBody.start()

func _physics_process(delta):
	if is_dead == false:
		if direction == 1:
			$AnimatedSprite.flip_h = false
		else:
			$AnimatedSprite.flip_h = true
		
		$AnimatedSprite.play("walk")
		velocity.x = WALK_SPEED * direction
		velocity.y += GRAVITY
		velocity = move_and_slide(velocity, FLOOR)
		
	if is_on_wall() || $RayCast2D.is_colliding() == false:
		direction = direction * -1
		$RayCast2D.position.x *= -1

func _on_RemoveDeadBody_timeout():
	queue_free()

func _on_Area2D_body_entered(body):
	if is_dead == false:
		if "Player" in body.name:
			body.kill()
