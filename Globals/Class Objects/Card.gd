extends Resource
class_name Card
 
const DEFAULT_TITLE: String = "Untitled Card"
const MAX_ARRAY_SIZE:int = 3
const MAX_ACCURACY: float = 100
const MIN_ACCURACY: float = 0
const MAX_TIME: float = 60
const MIN_TIME: float = 0
@export var title: String = DEFAULT_TITLE
@export var question: String = ""
@export var answer: String = ""
@export var isFavored: bool = false
@export var accuracyArray: Array[float] = []
@export var timeArray: Array[float] = []

## Returns new Card object
func _init(newTitle:String = DEFAULT_TITLE, newQuestion:String = "", newAnswer:String = "", newIsFavored:bool = false, newAccuracyArr:Array[float] = [], newTimeArr:Array[float] = []) -> void:
	title = newTitle
	question = newQuestion
	answer = newAnswer
	isFavored = newIsFavored
	accuracyArray = newAccuracyArr
	timeArray = newTimeArr

func getAverageAccuracy() -> float:
	if (accuracyArray.is_empty()): return -1
	else: return accuracyArray.reduce(func(total, next): return total + next) / MAX_ARRAY_SIZE
	#var result: float = accuracyArray.reduce(func(total, next): return total + next) / accuracyArray.size()
	#return result

func getAverageTime() -> float: 
	if (timeArray.is_empty()): return -1
	else: return timeArray.reduce(func(total, next): return total + next) / MAX_ARRAY_SIZE
	#var result: float = timeArray.reduce(func(total, next): return total + next) / timeArray.size()
	#return result

func isKnown() -> bool:
	return true if getAverageAccuracy() >= MAX_ACCURACY else false

func onAnswer(newAccuracy:float, newTime:float = -1):
	# add accuracy and time 
	accuracyArray.append(clamp(newAccuracy, MIN_ACCURACY, MAX_ACCURACY))
	if newTime != -1: 
		timeArray.append(clamp(newTime, MIN_TIME, MAX_TIME)) # don't add time if the answer was wrong (denoted as -1)
	
	# shrink arrays if needed
	while accuracyArray.size() > MAX_ARRAY_SIZE: accuracyArray.pop_front()
	while timeArray.size() > MAX_ARRAY_SIZE: timeArray.pop_front()

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
	return {
		"title": title, 
		"question": question, 
		"answer": answer,
		"accuracyArray": accuracyArray,
		"timeArray": timeArray,
		"isFavored": isFavored,
		}
