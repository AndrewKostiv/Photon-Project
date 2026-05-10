extends Control
# card display

signal nextScene(card:Card)
signal deleteCard(card:Card)
signal favorCard(card:Card)

@export var card:Card
@onready var title: Button = %Title

func setData(newCard:Card) -> void:
	card = newCard
	title.text = newCard.title

func _on_delete_pressed() -> void: 
	deleteCard.emit(card)
	queue_free()

func _on_favor_pressed() -> void: favorCard.emit(card)

func _on_title_pressed() -> void: nextScene.emit(card)
