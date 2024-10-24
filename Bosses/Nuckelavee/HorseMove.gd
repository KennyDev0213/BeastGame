extends State

var body : CharacterBody3D
var target : Transform3D
var nav : NavigationAgent3D
var move_speed : float = 10

func OnStateEnter():
	nav = controller.find_child("NavigationAgent3D")

func OnStateUpdate():
	if nav.is_target_reached():
		state_controller.ChangeState("Attack")
	else:
		var next_position = nav.get_next_path_position()
		var direction = (next_position - body.position).normalized()
		body.velocity = direction * move_speed
		
		body.move_and_slide()

func OnStateExit():
	pass
