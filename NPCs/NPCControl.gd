extends CharacterBody3D

@export var animator : AnimationPlayer
@export var targets : Node3D
var target : Node3D
var health : Health
var navAgent : NavigationAgent3D

func _ready():
	health = $Health
	health.onDeath.connect(death)
	navAgent = $NavigationAgent3D

func PlayAnimation(animation : String):
	animator.play(animation)

func death():
	$CollisionShape3D.process_mode = Node.PROCESS_MODE_DISABLED
	$RootNode/Armature/Skeleton3D.animate_physical_bones()
	$StateMachine.ChangeState("Dead")

func GetRandomTarget() -> Node3D:
	return targets.get_children().pick_random()

func SetTarget(new_target : Node3D):
	target = new_target
	navAgent.set_target_position(new_target.global_position)
