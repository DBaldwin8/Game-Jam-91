extends Node

# Autoload singleton; 
# tracks and mutates game state only
# (stolen count, wrong arrests, active thief reference).

var config = {
	"galaries" = 0,
	"paintings" = 0,
	"thieves" = 0,
	"visitors" = 0,
	"max wrong arrests" = 0,
	"max stolen painting" = 0
}

var state = {
	"stolen" = 0,
	"wrong arrests" = 0
}

func _ready() -> void:
	# Connect NPC signals
	SignalHub.stolen_painting.connect(painting_stolen_confirmation)
	# Needs the function to be referenced when signal is omitted.
	
	# Connect UI signals
	SignalHub.start_btn_clicked.connect(_on_start_btn_clicked)
	SignalHub.resume_btn_clicked.connect(_on_resume_btn_clicked)
	SignalHub.menu_btn_clicked.connect(_on_menu_btn_clicked)
	SignalHub.quit_btn_clicked.connect(_on_quit_btn_clicked)
	
	# Connect gallery signals
	SignalHub.NPC_leaving.connect(_on_NPC_leaving)

# TODO
 #- control game state [menu, play, pause]
 #- menu
	 #- spawn galaeries and paintings
	 #- show menu
 #- play
	 #- show instruction
	 #- spawn NPCs
 #- pause
	 #- state pause
	 #- pause everything
	 #- show pause UI
	
	
# Placeholder functions for UI signals
func _on_start_btn_clicked() -> void:
	print("Start button clicked - placeholder")

func _on_resume_btn_clicked() -> void:
	print("Resume button clicked - placeholder")

func _on_menu_btn_clicked() -> void:
	print("Menu button clicked - placeholder")

func _on_quit_btn_clicked() -> void:
	print("Quit button clicked - placeholder")
	
# PLaceholder functions for gallery signals
func _on_NPC_leaving(npc: Npc) -> void:
	print(npc.name, "is leaving!")
	
# Placeholder functions for NPC signals
func painting_stolen_confirmation(): #Function to react to the signal
	#print("CAN CONFIRM")
	pass
