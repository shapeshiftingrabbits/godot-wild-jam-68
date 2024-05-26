extends Node

signal confirmed

func _ready():
	confirmed.emit()
