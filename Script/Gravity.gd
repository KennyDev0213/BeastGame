extends Node

@onready var parent : CharacterBody3D = get_parent()

const GRAVITY = -2

@export var disable : bool

func _physics_process(_delta):
	if disable:
		return
	
	if !parent.is_on_floor():
		parent.velocity.y += GRAVITY
	else:
		parent.velocity.y = 0
	
	parent.velocity *= Vector3.UP
