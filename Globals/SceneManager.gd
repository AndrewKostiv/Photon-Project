extends Node

# Display cards
const DECK_DISPLAY = preload("res://Display Cards/Deck Display/deck_display.tscn")
const CARD_DISPLAY = preload("res://Display Cards/Card Display/card_display.tscn")
# Data editor menues
var DECK_MENU = preload("res://Pages/DeckMenu/Deck Menu.tscn")
var DECK_EDITOR = load("res://Pages/Data Editors/Deck Editor/deck_editor.tscn")

# Study Modes
const STUDY_MODE = preload("res://Pages/Study Modes/study_mode.tscn")
const AUTO = preload("res://Pages/Study Modes/Auto/Auto.tscn")
const MULTIPLE_CHOICE = preload("res://Pages/Study Modes/Multiple Choice/Multiple Choice.tscn")
const SPELLING = preload("res://Pages/Study Modes/Spelling/Spelling.tscn")
const SPEED = preload("res://Pages/Study Modes/Speed/Speed.tscn")

# Get display cards
func getDeckDisplay(): return DECK_DISPLAY.instantiate()
func getCardDisplay(): return CARD_DISPLAY.instantiate()

# Get editor menuess
func getDeckMenu(): return DECK_MENU.instantiate()
func getDeckEditor(): return DECK_EDITOR.instantiate()

## Change root scene
func changeSceneTo(newScene: PackedScene):
	if newScene: get_tree().change_scene_to_packed(newScene)
	else: printerr("Failed to change scene")
