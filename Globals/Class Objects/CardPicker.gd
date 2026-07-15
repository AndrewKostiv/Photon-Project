extends Node
class_name CardPicker

var deck: Deck
var lastCard: Card
enum modes {
	None,
	Auto,
	Multiple_Choice,
	Spelling,
	Speed,
}
var activeMode: modes

func _init(newSelectedDeck:Deck) -> void:
	deck = newSelectedDeck

func setDeck(newDeck:Deck) -> void:
	deck = newDeck

func getCard() -> Card:
	var result: Card = deck.getCard()

	return result
