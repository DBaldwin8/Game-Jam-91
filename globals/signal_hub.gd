extends Node

signal stolen_painting

func emit_stolen_painting():
	stolen_painting.emit()
	print("A painting has been stolen.")
