extends Control

@onready var deck: Deck = Data.selectedDeck
@onready var activeMode = Data.selectedStudyMode

func _ready() -> void:
	match activeMode:
		Data.Mode.AUTO: startAuto()
		Data.Mode.MULTIPLECHOICE: startMultipleChoice()
		Data.Mode.SPELLING: startSpelling()
		Data.Mode.SPEED: startSpeed()
		#_: SceneManager.changeSceneTo(SceneManager.DECK_EDITOR)

func startAuto() -> void:
	var auto = SceneManager.AUTO.instantiate()
	add_child(auto)
	#TODO: Connect signals

func startMultipleChoice() -> void:
	var MC = SceneManager.MULTIPLE_CHOICE.instantiate()
	add_child(MC)
	MC.newAnswer.connect(onAnswer)
	
func startSpelling() -> void:
	var spelling = SceneManager.SPELLING.instantiate()
	add_child(spelling)
	#TODO: Connect signals

func startSpeed() -> void:
	var speed = SceneManager.SPEED.instantiate()
	add_child(speed)
	#TODO: Connect signals

func onAnswer(userAnswer:String):
	print_debug(userAnswer)

func _on_back_pressed() -> void:
	SceneManager.changeSceneTo(SceneManager.DECK_EDITOR)
