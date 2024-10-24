extends CharacterBody3D

const MAX_LOOK_ANGLE = deg_to_rad(70)
const SPRINT_SPEED = 2
var LOOK_SPEED = 0.01
var MOVE_SPEED = 10

var x_rot = 0
var y_rot = 0

var camera : Camera3D

@export var health : Health
@export var stamina : Stamina

func _ready():
	camera = find_child("PlayerCamera")
	
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	
	#get settings

func _input(event):
	if event is InputEventMouseMotion:
		var m_vel = event.relative
		
		x_rot += m_vel.x * LOOK_SPEED
		y_rot += m_vel.y * LOOK_SPEED
		
		y_rot = clamp(y_rot, -MAX_LOOK_ANGLE, MAX_LOOK_ANGLE)
		
		camera.transform.basis = Basis()
		transform.basis = Basis()
		
		camera.rotate_x(-y_rot)
		rotate(Vector3.UP, -x_rot)

func _process(_delta):
	var forward = transform.basis.z
	var left = forward.rotated(Vector3.UP, deg_to_rad(90))
	
	var is_moving = false
	
	if Input.is_action_pressed("move_forward"):
		velocity += forward * MOVE_SPEED  * -1
		is_moving = true
	if Input.is_action_pressed("move_backward"):
		velocity += forward * MOVE_SPEED
		is_moving = true
	if Input.is_action_pressed("move_left"):
		velocity += left * MOVE_SPEED * -1
		is_moving = true
	if Input.is_action_pressed("move_right"):
		velocity += left * MOVE_SPEED
		is_moving = true
	
	if Input.is_action_pressed("sprint") and is_moving and stamina.CURRENT_STAMINA > 0:
		#velocity *= (Vector3.FORWARD + Vector3.LEFT) * SPRINT_SPEED + Vector3.UP
		velocity *= Vector3(SPRINT_SPEED, 1, SPRINT_SPEED)
		stamina.Remove(1)

	move_and_slide()
