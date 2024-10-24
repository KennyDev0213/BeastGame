extends Node

class_name Stamina

@export var MAX_STAMINA = 100
var CURRENT_STAMINA = MAX_STAMINA
var STAMINA_RECOVER_RATE = 3
var can_recover = false

signal On_Stamina_Change
func Add(amount : float):
	On_Stamina_Change.emit()
	if CURRENT_STAMINA <= MAX_STAMINA:
		CURRENT_STAMINA += amount
	
	if CURRENT_STAMINA > MAX_STAMINA:
		CURRENT_STAMINA = MAX_STAMINA
		can_recover = false

func Remove(amount : float):
	On_Stamina_Change.emit()
	if CURRENT_STAMINA > 0:
		CURRENT_STAMINA -= amount
		$RecoveryCooldown.start()

func GetPercentage() -> float:
	return CURRENT_STAMINA / MAX_STAMINA


func _process(_delta):
	if can_recover:
		Add(1 * STAMINA_RECOVER_RATE)

func _on_recovery_cooldown_timeout():
	can_recover = true
