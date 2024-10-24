extends State

@export var NPCspeed = 5

func OnStateEnter():
	print("Character is now in Move state")
	controller.PlayAnimation("Move")

func OnStateUpdate():
	if controller.target == null or controller.navAgent.is_target_reached():
		state_controller.ChangeState("Idle")
	
	elif !controller.is_on_floor():
		controller.move_and_slide()
	
	else:
		#calculate velocity using nav agent
		var direction = controller.navAgent.get_next_path_position() - controller.global_position
		var corrected_dir = direction.normalized() 
		controller.velocity = corrected_dir * NPCspeed
		
		#rotate based on velocity
		controller.basis = Basis.looking_at(controller.velocity)
		controller.rotate(Vector3.UP, deg_to_rad(90))
		
		#move character
		controller.move_and_slide()
	
	#print(controller.position)
