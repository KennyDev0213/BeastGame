extends CharacterBody3D

@export var health : Health 
@export var animator : AnimationPlayer

var target : Node3D

func _ready():
	health.onDeath.connect(death)
	
	if animator == null:
		animator = find_child("AnimationPlayer")

func PlayAnimation(animation : String):
	animator.play(animation)

func death():
	$RootNode/Armature/Skeleton3D.animate_physical_bones()
	$StateControl.ChangeState("Dead")
	#animator.play("HorseDeath")
