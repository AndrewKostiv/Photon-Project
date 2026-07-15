extends Control
# deck display

@onready var delete_deck: Button = %DeleteDeck
@export var deck:Deck

func _ready() -> void:
	delete_deck.visible = true  # TODO: fix this so it only shows when hovered

func setData(newDeck:Deck): 
	deck = newDeck
	%TitleLabel.text = newDeck.title

func _on_delete_pressed() -> void:
	Data.decks.erase(deck)
	Data.saveData()
	queue_free()

func _on_deck_button_pressed() -> void: 
	Data.selectedDeck = deck
	SceneManager.changeSceneTo(SceneManager.DECK_EDITOR)

#func _on_mouse_entered() -> void:
	#delete_deck.visible = true
#
#func _on_mouse_exited() -> void:
	#delete_deck.visible = false
