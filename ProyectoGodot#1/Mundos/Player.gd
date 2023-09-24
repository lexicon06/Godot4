extends CharacterBody3D

var move_speed : float = 14.0
var jump_force : float = 8.0
var gravity : float = 20.0

var facing_angle : float

func _physics_process(delta):
	
	var input = Input.get_vector("move_left", "move_right", "move_forward", "move_backward")
	var dir = Vector3(input.x, 0, input.y)
	
	velocity = dir * move_speed
	
	move_and_slide()
