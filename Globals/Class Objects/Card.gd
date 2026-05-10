extends Resource
class_name Card
 
@export var title: String = ""
@export var items: Array[Item] = [ 
	Item.new("Question1", ["Answer1"]),
	Item.new("Question2", ["Answer2"]),
	Item.new("Question3", ["Answer3"]),
	Item.new("Question4", ["Answer4"]),]

## Returns new Card object
func _init(newTitle:String = "", newItems:Array[Item] = []) -> void:
	title = newTitle
	items = newItems

## Returns all class data as a Dictionary 
## [br][br]
## Returns {"title": title:String, "items": items:Array[lb]Item[rb]}
## [br][br]
## [b]Example Output:[/b]
## [codeblock]
## {"title": title, "items": [...]}
## [/codeblock]
func getData() -> Dictionary:
	var data: Dictionary = {"title": title, "items": [] }
	for item:Item in items: data.items.append(item.getData())
	return data

## Adds an item to items:Array[Item] and saves
func addItem(newItem:Item = Item.new()) -> void:
	items.append(newItem)
	Data.saveData()

## Removes an item from items:Array[Item] and saves
func removeItem(item:Item) -> void:
	items.erase(item)
	Data.saveData()
