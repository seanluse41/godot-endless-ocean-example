extends CharacterBody3D


const SPEED = 5.0
const JUMP_VELOCITY = 4.5
var isSprint = false

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")


func _physics_process(delta):

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir = Input.get_vector("left", "right", "up", "down")
	var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if Input.is_action_pressed("sprint"):
		isSprint = true
	else:
		isSprint = false
	if direction:
		if isSprint:
			velocity.x = direction.x * SPEED * 20
			velocity.z = direction.z * SPEED * 20
		else:
			velocity.x = direction.x * SPEED
			velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)

	move_and_slide()
