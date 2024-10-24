extends ColorRect

@export var stamina : Stamina

var max_size = scale.x

func _ready():
	stamina.On_Stamina_Change.connect(update_ui)

func update_ui():
	scale.x = max_size * stamina.GetPercentage()
