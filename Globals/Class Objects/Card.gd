extends Resource
class_name Card
 
const DEFAULT_TITLE: String = "Untitled Card"
@export var title: String = DEFAULT_TITLE
@export var question: String = ""
@export var answer: String = ""

## Returns new Card object
func _init(newTitle:String = DEFAULT_TITLE, newQuestion:String = "", newAnswer:String = "") -> void:
	title = newTitle
	question = newQuestion
	answer = newAnswer

## Returns all class data as a Dictionary 
## [br][br]
## Returns {"title": title:String, "items": items:Array[lb]Item[rb]}
## [br][br]
## [b]Example Output:[/b]
## [codeblock]
## {"title": title, "items": [...]}
## [/codeblock]
func getData() -> Dictionary:
	#var data: Dictionary = {"title": title, "question": question, "answer": answer }
	#return data
	return {"title": title, "question": question, "answer": answer }
