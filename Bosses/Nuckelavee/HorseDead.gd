extends State

func OnStateEnter():
	controller.find_child("HorseCollider").process_mode = Node.PROCESS_MODE_DISABLED
