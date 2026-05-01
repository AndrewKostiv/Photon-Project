extends Node
class_name Deck

@export var title:String
@export var cards = []

func _init(newTitle:String = "", newCards:Array[Card] = []) -> void:
	title = newTitle
	cards = newCards

func getData():
	var data: Dictionary = { "title": title, "cards": [] }
	for card:Card in cards: data.cards.append(card.getData())
	return data

func addCard(newCard:Card = Card.new("Untitled Card")) -> void:
	cards.append(newCard)
	Data.saveData()

func removeCard(card:Card) -> void:
	cards.erase(card)
	Data.saveData()
