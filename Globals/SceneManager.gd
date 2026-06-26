extends Node

# Display cards
const DECK_DISPLAY = preload("res://Display Cards/Deck Display/deck_display.tscn")
const CARD_DISPLAY = preload("res://Display Cards/Card Display/card_display.tscn")
# Data editor menues
var DECK_MENU = preload("res://Pages/DeckMenu/Deck Menu.tscn")
const DECK_EDITOR = preload("res://Pages/Data Editors/Deck Editor/deck_editor.tscn")
const CARD_EDITOR = preload("res://Pages/Data Editors/Card Editor/Card Editor.tscn")

# Get display cards
func getDeckDisplay(): return DECK_DISPLAY.instantiate()
func getCardDisplay(): return CARD_DISPLAY.instantiate()

# Get editor menuess
func getDeckMenu(): return DECK_MENU.instantiate()
func getDeckEditor(): return DECK_EDITOR.instantiate()
func getCardEditor(): return CARD_EDITOR.instantiate()

## Change root scene
func changeSceneTo(newScene: PackedScene):
	if newScene: get_tree().change_scene_to_packed(newScene)
	else: printerr("Failed to change scene")
