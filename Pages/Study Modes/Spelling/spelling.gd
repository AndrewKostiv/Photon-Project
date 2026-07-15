extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func _on_button_pressed() -> void:
	SceneManager.changeSceneTo(SceneManager.DECK_EDITOR)
