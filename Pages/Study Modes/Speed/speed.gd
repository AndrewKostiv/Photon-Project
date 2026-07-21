extends Control

signal newAnswer(userAnswer:String)

func _ready() -> void:
	%UserInput.edit()

func _on_back_pressed() -> void:
	SceneManager.changeSceneTo(SceneManager.DECK_EDITOR)

func _on_user_input_text_submitted(new_text: String) -> void:
	newAnswer.emit(new_text)
	%UserInput.text = ""
