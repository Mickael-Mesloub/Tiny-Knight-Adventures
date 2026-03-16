extends CharacterBody2D


const SPEED = 130.0
const JUMP_VELOCITY = -300.0

# Used for coyote time to allow character to jump even if he's not on the ground anymore for a few frames
var is_falling = false
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var coyote_time: Timer = $CoyoteTime


func _physics_process(delta: float) -> void:
	
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	
	# Handle jump.
	if Input.is_action_just_pressed("jump"):
		if is_on_floor() or !coyote_time.is_stopped():
			velocity.y = JUMP_VELOCITY
		
	if !is_on_floor() and !is_falling:
		coyote_time.start()
		is_falling = true

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	# Get the input direction: -1, 0 or 1
	var direction := Input.get_axis("move_left", "move_right")
	
	# Flip the sprite
	if direction > 0:
		animated_sprite.flip_h = false
	elif direction < 0: 
		animated_sprite.flip_h = true
	
	# Play animations
	if is_on_floor():
		is_falling = false  
		if direction == 0:
			animated_sprite.play("Idle")
		else: 
			animated_sprite.play("run")
	else:
		animated_sprite.play("jump")
	
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
