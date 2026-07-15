extends Control

signal newAnswer(userAnswer:String)

@onready var question_lbl: Label = %question
@onready var answer_lbl_1: Label = %"Answer 1"
@onready var answer_lbl_2: Label = %"Answer 2"
@onready var answer_lbl_3: Label = %"Answer 3"
@onready var answer_lbl_4: Label = %"Answer 4"
@onready var user_input: LineEdit = %UserInput


func setData(question:Card, answers:Array[Card]) -> void:
	question_lbl.text = question.question
	answer_lbl_1.text = answers[0].answer
	answer_lbl_2.text = answers[1].answer 
	answer_lbl_3.text = answers[2].answer 
	answer_lbl_4.text = answers[3].answer 

func _on_user_input_text_submitted(new_text: String) -> void:
	newAnswer.emit(new_text)


func _on_back_pressed() -> void:
	SceneManager.changeSceneTo(SceneManager.DECK_EDITOR)
