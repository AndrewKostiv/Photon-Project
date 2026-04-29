extends Node

signal decksLoaded

const SAVE_FILE_PATH: String = "user://StudyToolSave.save"
var decks: Array[Deck] = []
var activeDeck: Deck 

func _ready() -> void:
	loadData()

func saveData():
	var data:Dictionary = { "decks":[] }
	for deck:Deck in decks: data.decks.append(deck.getData())
	var decksJSON = JSON.stringify(data)
	var save_file = FileAccess.open(SAVE_FILE_PATH, FileAccess.WRITE)
	save_file.store_line(decksJSON)
	save_file.close()

func loadData():
	if not FileAccess.file_exists(SAVE_FILE_PATH):
		printerr("No save file found")
		return
	var save_file = FileAccess.open(SAVE_FILE_PATH, FileAccess.READ)
	while save_file.get_position() < save_file.get_length():
		# get data
		var json_string = save_file.get_line()
		var json = JSON.new()
		# validate load
		var parse_result = json.parse(json_string) 
		if not parse_result == OK: 
			printerr("JSON Parse Error: ", json.get_error_message(), " in ", json_string, " at line ", json.get_error_line())
			continue
		# extract data
		var data:Dictionary = json.data
		# parse extracted data into usable deck objects
		decks = getDecks(data.decks)
	save_file.close()
	decksLoaded.emit()

func getDecks(decksArray:Array) -> Array[Deck]:
	var result:Array[Deck] = []
	for deck: Dictionary in decksArray: result.append(Deck.new(deck.title, getCards(deck.cards)))
	return result

func getCards(cardsArray:Array) -> Array[Card]:
	var result: Array[Card] = []
	for card: Dictionary in cardsArray: result.append(Card.new(card.title, getItems(card.items)))
	return result

func getItems(itemsArray:Array) -> Array[Item]:
	var result: Array[Item] = []
	for item: Dictionary in itemsArray: result.append(Item.new(item.question, item.answer))
	return result
