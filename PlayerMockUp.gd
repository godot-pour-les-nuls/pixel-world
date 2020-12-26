extends KinematicBody2D

const WALKING_SPEED = 30
const GRAVITY = 10
const FLOOR = Vector2(0, -1)
const MAP_RIGHT_LIMIT = 1684
var velocity = Vector2(WALKING_SPEED, 0)

func _ready():
	$AnimatedSprite.play('run')

func _physics_process(delta):
	if self.position.x >= MAP_RIGHT_LIMIT:
		velocity.x = 0
		$AnimatedSprite.play('idle')
		
	velocity.y += GRAVITY
	velocity = move_and_slide(velocity, FLOOR)
