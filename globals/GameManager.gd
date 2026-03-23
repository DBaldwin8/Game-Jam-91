extends Node

# Autoload singleton; 
# tracks and mutates game state only
# (stolen count, wrong arrests, active thief reference).
const GALLERY = preload("res://scenes/gallery/gallery.tscn")

# Configuration of level intention for loading from
var config = {
	"galleries" = 3,
	"paintings" = 0,
	"thieves" = 0,
	"visitors" = 0,
	"max wrong arrests" = 0,
	"max stolen painting" = 0
}
# Current states that effect score
var state = {
	"stolen" = 0,
	"wrong arrests" = 0
}

func _ready() -> void:
	# Connect NPC signals
	SignalHub.stolen_painting.connect(painting_stolen)

	# Connect UI signals
	SignalHub.start_btn_clicked.connect(_on_start_btn_clicked)
	SignalHub.resume_btn_clicked.connect(_on_resume_btn_clicked)
	SignalHub.menu_btn_clicked.connect(_on_menu_btn_clicked)
	SignalHub.quit_btn_clicked.connect(_on_quit_btn_clicked)

	# Connect gallery signals
	SignalHub.NPC_leaving.connect(_on_NPC_leaving)
	
	spawn_galleries()

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
func painting_stolen(): #Function to react to the signal
	state.stolen += 1

# Game Manager stuff
func spawn_galleries() -> void:
	var viewport_height = get_viewport().size.y
	print(viewport_height)
	for i in range(config.galleries):
		var new_gallery = GALLERY.instantiate()
		add_child(new_gallery)
		new_gallery.position = Vector2(0.0,viewport_height * i)
		pass

# TODO
 #- control game state [menu, play, pause]
 #- menu
	 #- spawn galleries and paintings
	 #- show menu
 #- play
	 #- show instruction
	 #- spawn NPCs
 #- pause
	 #- state pause
	 #- pause everything
	 #- show pause UI
	