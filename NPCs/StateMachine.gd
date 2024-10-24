extends Node

class_name StateMachine

var states : Dictionary

@onready var current_state : State

func _ready():
	for child in get_children():
		if child is State:
			states[child.name] = child
	
	current_state = states["Idle"]
	current_state.OnStateEnter()

func ChangeState(new_state : String):
	current_state.OnStateExit()
	current_state = states[new_state]
	current_state.OnStateEnter()

func _process(_delta):
	current_state.OnStateUpdate()
