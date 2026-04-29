extends Node
class_name Card
 
var title: String
var items: Array[Item] = [
	Item.new("Question1", "Answer1"),
	Item.new("Question2", "Answer2"),
	Item.new("Question3", "Answer3"),
	Item.new("Question4", "Answer4"),
]

func _init(newTitle:String = "", newItems:Array[Item] = []) -> void:
	title = newTitle
	items = newItems

func getData() -> Dictionary:
	var data: Dictionary = {"title": title, "items": [] }
	for item:Item in items: data.items.append(item.getData())
	return data
