extends Control
# card display

signal deleteCard(card:Card)

const EMPTY_STAR = preload("res://Images/EmptyStar.jpg")
const FILLED_STAR = preload("res://Images/FilledStar.jpg")

@export var card:Card
@onready var question: LineEdit = %Question
@onready var answer: LineEdit = %Answer
@onready var favor: Button = %Favor

func setData(newCard:Card) -> void:
	card = newCard
	favor.icon = FILLED_STAR if card.isFavored else EMPTY_STAR
	question.text = newCard.question
	answer.text = newCard.answer

func _on_delete_pressed() -> void: 
	deleteCard.emit(card)
	queue_free()

func _on_favor_pressed() -> void: 
	card.isFavored = !card.isFavored
	favor.icon = FILLED_STAR if card.isFavored else EMPTY_STAR
	print_debug("Test")

func _on_question_text_changed(new_text: String) -> void:
	card.question = new_text

func _on_answer_text_changed(new_text: String) -> void:
	card.answer = new_text
