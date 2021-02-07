extends KinematicBody2D

# des constantes similaires à ce qui a été fait sur le Player
const WALKING_SPEED = 30
const GRAVITY = 10
const FLOOR = Vector2(0, -1)
const MAP_RIGHT_LIMIT = 1684

# on lui donne une velocité en abscisse
var velocity = Vector2(WALKING_SPEED, 0)

func _ready():
	# on lance l'animation run dès le chargement de la node
	$AnimatedSprite.play('run')

func _physics_process(_delta):
	# si le KinematicBody2D atteint la limite
	if self.position.x >= MAP_RIGHT_LIMIT:
		velocity.x = 0 # il s'arrête
		$AnimatedSprite.play('idle')
		
	# comme pour notre Player, il est soumi à la gravité
	velocity.y += GRAVITY
	# et on se sert de move_and_slide pour les déplacements
	velocity = move_and_slide(velocity, FLOOR)
