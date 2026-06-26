extends Control
# Card editor

@onready var title_edit: LineEdit = %"Title Edit"
@onready var items_container: VBoxContainer = %"Items Container"

var card: Card

func setup(newCard:Card) -> void:
	card = newCard
	title_edit.text = newCard.title

## Returns card:Card
## [br]
## Used by Main to manage scenes
func getData():
	return card

func _on_title_edit_text_changed(new_text: String) -> void:
	card.title = new_text
	Data.saveData()

func _on_delete_pressed() -> void:
	pass # Replace with function body.

func _on_swap_pressed() -> void:
	pass
