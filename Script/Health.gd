extends Node

class_name Health

@export var MAX_HEALTH = 100
var CURRENT_HEALTH = MAX_HEALTH

signal onDeath
signal onHealthChange

func Add(amount):
	onHealthChange.emit()
	CURRENT_HEALTH += amount
	if CURRENT_HEALTH > MAX_HEALTH:
		CURRENT_HEALTH = MAX_HEALTH

func Remove(amount):
	onHealthChange.emit()
	CURRENT_HEALTH -= amount
	if CURRENT_HEALTH <= 0:
		onDeath.emit()
