extends KinematicBody2D

const SPEED = 60
const GRAVITY = 10
const JUMP_POWER = -250
const FLOOR = Vector2(0, -1);
const FIREBALL = preload("res://Fireball.tscn")

var velocity = Vector2()
var on_ground = false
var on_wall = false
var is_attacking = false

func run(direction):
	if is_attacking == false || on_ground == false:
			velocity.x = -SPEED if direction == "left" else SPEED
			if is_attacking == false:
				$AnimatedSprite.play("run")
				$AnimatedSprite.flip_h = true if direction == "left" else false
				if sign($Position2D.position.x) == -1 && direction == "right":
					$Position2D.position.x *= -1
				if sign($Position2D.position.x) == 1 && direction == "left":
					$Position2D.position.x *= -1

func _physics_process(delta):
	if Input.is_action_pressed("ui_right"):
		run("right")
	elif Input.is_action_pressed("ui_left"):
		run("left")
	else:
		velocity.x = 0
		if on_ground && is_attacking == false:
			$AnimatedSprite.play("idle")
		
	if Input.is_action_pressed("ui_up"):
		if is_attacking == false:
			if on_ground:
				velocity.y = JUMP_POWER
				on_ground = false
			
	if Input.is_action_just_pressed("ui_focus_next") && is_attacking == false:
		if on_ground:
			velocity.x = 0
		is_attacking = true
		$AnimatedSprite.play("attack")
		var fireball = FIREBALL.instance()
		var direction = sign($Position2D.position.x)
		fireball.set_fireball_direction(direction)
		get_parent().add_child(fireball)
		fireball.position = $Position2D.global_position
	
	velocity.y += GRAVITY
	
	if is_on_floor():
		if on_ground == false:
			is_attacking = false
		on_ground = true
		on_wall = false
	else:
		if is_attacking == false:
			on_ground = false
			if velocity.y < 0:
				$AnimatedSprite.play("jump")
				on_wall = false
			else:
				$AnimatedSprite.play("fall")	

	velocity = move_and_slide(velocity, FLOOR)

func _on_AnimatedSprite_animation_finished():
	is_attacking = false
