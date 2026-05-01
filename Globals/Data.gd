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
	print_debug("Save Data")

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

func generate_uuid() -> String:
	var crypto = Crypto.new()
	var bytes = crypto.generate_random_bytes(16)
	
	# Set the version (4) and variant (RFC4122) bits
	bytes[6] = (bytes[6] & 0x0f) | 0x40
	bytes[8] = (bytes[8] & 0x3f) | 0x80
	
	return "%02x%02x%02x%02x-%02x%02x-%02x%02x-%02x%02x-%02x%02x%02x%02x%02x%02x" % [
		bytes[0], bytes[1], bytes[2], bytes[3],
		bytes[4], bytes[5],
		bytes[6], bytes[7],
		bytes[8], bytes[9],
		bytes[10], bytes[11], bytes[12], bytes[13], bytes[14], bytes[15]
	]
