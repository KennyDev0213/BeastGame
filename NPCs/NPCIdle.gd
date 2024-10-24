extends State

func OnStateEnter():
	print("Character is now in Idle state")
	controller.PlayAnimation("Idle")

func OnStateUpdate():
	if controller.target == null or controller.navAgent.is_target_reached():
		controller.SetTarget(controller.GetRandomTarget())
		#print(controller.target.position)
	elif controller.target != null:
		#print("Character is now moving")
		state_controller.ChangeState("Move")

func OnStateExit():
	pass
