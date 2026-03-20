extends Control
class_name Hud

@onready var paintings: Label = $MarginContainer/VBoxContainer/Paintings

func _ready() -> void:
	SignalHub.stolen_painting.connect(update_painting_label)
	#SignalHub.wrong_arrest.connect(update_arrest_label)
	#SignalHub.caught_theif.connect(update_theif_label)

func update_painting_label() -> void:
	var stolen_str = str(GameManager.STATE.stolen).pad_zeros(3)
	paintings.text = "Paintings Lost: " + stolen_str

#func update_arrest_label() -> void:
	#var arrest_str = str(GameManager.STATE.wrong_arrests).pad_zeros(3)
	#arrests.text = "Wrong Arrests: " + arrest_str
#
#func update_theif_label() -> void:
	#var thief_str = str(GameManager.STATE.caught_thiefs).pad_zeros(3)
	#thieves.text = "Thieves Caught: " + thief_str
