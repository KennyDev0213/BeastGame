extends State

var attacks = ["HorseBite", "HorseSmash"]

func OnStateEnter():
	Attack()

func OnStateUpdate():
	pass

func Attack():
	var random_animation = randi_range(0, len(attacks) - 1)
	controller.PlayAnimation(attacks[random_animation])
