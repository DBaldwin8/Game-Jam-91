extends Node

<<<<<<< HEAD
signal NPC_leaving

func emit_NPC_leaving(NPC) -> void:
	NPC_leaving.emit(NPC)
=======
signal stolen_painting
# function to be called for emitting signal.
func emit_stolen_painting():
	stolen_painting.emit()
	print("A painting has been stolen.")
>>>>>>> steal
