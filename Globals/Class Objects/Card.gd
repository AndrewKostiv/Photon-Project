extends Resource
class_name Card
 
const DEFAULT_TITLE: String = "Untitled Card"
@export var title: String = DEFAULT_TITLE
@export var question: String = ""
@export var answer: String = ""
@export var isFavored: bool = false
@export var accuracyArr: Array[float] = []
@export var timeArr: Array[float] = []

func getAverageAccuracy() -> float:
	if (accuracyArr.size() == 0): return -1
	else: return accuracyArr.reduce(func(total, next): return total + next) / accuracyArr.size()
	#var result: float = accuracyArr.reduce(func(total, next): return total + next) / accuracyArr.size()
	#return result

func getAverageTime() -> float: 
	if (timeArr.size() == 0): return -1
	else: return timeArr.reduce(func(total, next): return total + next) / timeArr.size()
	#var result: float = timeArr.reduce(func(total, next): return total + next) / timeArr.size()
	#return result

func isKnown() -> bool:
	return true if getAverageAccuracy() >= 100 else false

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
