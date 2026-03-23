extends Node

# Gallery Signals
signal NPC_leaving(NPC)

func emit_NPC_leaving(NPC: Npc) -> void:
	NPC_leaving.emit(NPC)


# UI Signals
signal start_btn_clicked
signal resume_btn_clicked
signal menu_btn_clicked
signal quit_btn_clicked

func emit_start_btn_clicked() -> void:
	start_btn_clicked.emit()

func emit_resume_btn_clicked() -> void:
	resume_btn_clicked.emit()
	
func emit_menu_btn_clicked() -> void:
	menu_btn_clicked.emit()

func emit_quit_btn_clicked() -> void:
	quit_btn_clicked.emit()


# NPC Signals
signal stolen_painting
	
# function to be called for emitting signal.
func emit_stolen_painting():
	stolen_painting.emit()
