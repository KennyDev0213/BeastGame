extends ColorRect

@export var health : Health

func _ready():
	health.onHealthChange.connect(update_ui)

func update_ui():
	scale.x = health.MAX_HEALTH * health.GetPercentage()
