extends Control
signal deleteCard(card:Card)
signal favorCard(card:Card)
@export var card:Card
@onready var title: LineEdit = %title

func setData(newCard:Card) -> void:
	card = newCard
	title.text = newCard.title

func _on_delete_pressed() -> void:
	deleteCard.emit(card)
	queue_free()

func _on_favor_pressed() -> void: favorCard.emit(self)

func _on_title_text_changed(new_text: String) -> void:
	card.title = new_text
