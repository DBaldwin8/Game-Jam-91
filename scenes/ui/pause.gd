extends Control
class_name PauseMenu


func _on_resume_pressed() -> void:
	SignalHub.emit_resume_btn_clicked()

func _on_main_menu_pressed() -> void:
	SignalHub.emit_menu_btn_clicked()
