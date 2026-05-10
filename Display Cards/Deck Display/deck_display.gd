extends Control
# deck display

signal nextScene(deck:Deck)

@export var deck:Deck

func setDeck(newDeck:Deck): 
	deck = newDeck
	%TitleLabel.text = newDeck.title

func _on_delete_pressed() -> void:
	Data.decks.erase(deck)
	Data.saveData()
	queue_free()

func _on_deck_button_pressed() -> void: nextScene.emit(deck)
