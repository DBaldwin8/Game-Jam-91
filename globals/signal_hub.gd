extends Node

signal stolen_painting
# function to be called for emitting signal.
func emit_stolen_painting():
	stolen_painting.emit()
	print("A painting has been stolen.")
