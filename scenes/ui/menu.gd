extends Control
class_name Menu



func _on_start_pressed() -> void:
	SignalHub.emit_start_btn_clicked()

func _on_quit_pressed() -> void:
	SignalHub.emit_quit_btn_clicked()
