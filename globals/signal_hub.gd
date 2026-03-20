extends Node

signal NPC_leaving

func emit_NPC_leaving(NPC) -> void:
	NPC_leaving.emit(NPC)
