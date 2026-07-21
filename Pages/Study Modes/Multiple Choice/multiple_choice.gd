extends Control

signal newAnswer(userAnswer:String, time:float)

@onready var question_lbl: Label = %question
@onready var answer_lbl_1: Label = %"Answer 1"
@onready var answer_lbl_2: Label = %"Answer 2"
@onready var answer_lbl_3: Label = %"Answer 3"
@onready var answer_lbl_4: Label = %"Answer 4"
@onready var user_input: LineEdit = %UserInput

var trueAnswerCard: Card
var elapsedTime: float = 0.0

func _ready() -> void:
	%UserInput.edit()
	var activeCard = Data.activeCards[0]
	question_lbl.text = activeCard.question
	var answerList: Array[Card] = Data.selectedDeck.getAnswerList(Data.activeCards[0])
	answer_lbl_1.text = answerList[0].answer
	answer_lbl_2.text = answerList[1].answer 
	answer_lbl_3.text = answerList[2].answer 
	answer_lbl_4.text = answerList[3].answer 

func _on_user_input_text_submitted(new_text: String) -> void:
	newAnswer.emit(new_text, elapsedTime)
	user_input.text = ""

func _on_back_pressed() -> void:
	SceneManager.changeSceneTo(SceneManager.DECK_EDITOR)

func _on_timer_timeout() -> void:
	elapsedTime += $Timer.wait_time
