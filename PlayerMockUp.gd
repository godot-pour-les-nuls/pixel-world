extends KinematicBody2D

const WALKING_SPEED = 40
const GRAVITY = 10
const FLOOR = Vector2(0, -1)
const MAP_RIGHT_LIMIT = 1680
var velocity = Vector2()

func _physics_process(delta):
	if self.position.x <= MAP_RIGHT_LIMIT:
		velocity.x = WALKING_SPEED
		$AnimatedSprite.play('run')
	else: 
		velocity.x = 0
		$AnimatedSprite.play('idle')
		
	velocity.y += GRAVITY
	velocity = move_and_slide(velocity, FLOOR)
