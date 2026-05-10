extends Resource
class_name Item

@export var question: String
@export var answers: Array[String]

## Returns new Item object
func _init(newQuestion:String = "", newAnswers:Array[String] = []) -> void:
	question = newQuestion
	answers = newAnswers

## Returns all class data as a Dictionary 
## [br][br]
## Returns {"question": question:String, "answer": answer:String}
## [br][br]
## [b]Example Output:[/b]
## [codeblock]
## {"question": question, "answer": answer}
## [/codeblock]
func getData() -> Dictionary: 
	var data:Dictionary = { "question": question, "answers": [] }
	for answer:String in answers: data.answers.append(answer)
	return  data

func getAnswers() -> Array[String]:
	return answers
