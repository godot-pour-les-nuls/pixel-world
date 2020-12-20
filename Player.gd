extends KinematicBody2D

const SPEED = 60
const GRAVITY = 10
const JUMP_POWER = -250
const FLOOR = Vector2(0, -1);
const FIREBALL = preload("res://Fireball.tscn")

var velocity = Vector2()
var on_ground = false
var is_attacking = false

func _physics_process(delta):
	if Input.is_action_pressed("ui_right"):
		if is_attacking == false || on_ground == false:
			velocity.x = SPEED
			if is_attacking == false:
				$AnimatedSprite.play("run")
				$AnimatedSprite.flip_h = false
				if sign($Position2D.position.x) == -1:
					$Position2D.position.x *= -1
	elif Input.is_action_pressed("ui_left"):
		if is_attacking == false || on_ground == false:
			velocity.x = -SPEED
			if is_attacking == false:
				$AnimatedSprite.flip_h = true
				$AnimatedSprite.play("run")
				if sign($Position2D.position.x) == 1:
					$Position2D.position.x *= -1
	else:
		velocity.x = 0
		if on_ground && is_attacking == false:
			$AnimatedSprite.play("idle")
		
	if Input.is_action_pressed("ui_up"):
		if on_ground && is_attacking == false:
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
	else:
		if is_attacking == false:
			on_ground = false
			if velocity.y < 0:
				$AnimatedSprite.play("jump")
			else:
				$AnimatedSprite.play("fall")
		

	velocity = move_and_slide(velocity, FLOOR)


func _on_AnimatedSprite_animation_finished():
	is_attacking = false
