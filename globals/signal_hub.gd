extends Node

signal NPC_leaving
signal stolen_painting

func emit_NPC_leaving(NPC) -> void:
	NPC_leaving.emit(NPC)
	
# function to be called for emitting signal.
func emit_stolen_painting():
	stolen_painting.emit()
	print("A painting has been stolen.")
