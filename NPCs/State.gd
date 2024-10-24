extends Node
class_name State

@onready var state_controller : StateMachine = get_parent()
@onready var controller : CharacterBody3D = state_controller.get_parent()

func OnStateEnter():
	pass

func OnStateUpdate():
	pass

func OnStateExit():
	pass
