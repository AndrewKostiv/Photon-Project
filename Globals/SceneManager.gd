extends Node

# Display cards
const DECK_DISPLAY = preload("res://Display Cards/Deck Display/deck_display.tscn")
const CARD_DISPLAY = preload("res://Display Cards/Card Display/card_display.tscn")
const ITEM_DISPLAY = preload("res://Display Cards/Item Display/item_display.tscn")

# Data editor menues
var DECK_MENU = preload("res://Pages/DeckMenu/Deck Menu.tscn")
const DECK_EDITOR = preload("res://Pages/Data Editors/Deck Editor/deck_editor.tscn")
const CARD_EDITOR = preload("res://Pages/Data Editors/Card Editor/Card Editor.tscn")
const ITEM_EDITOR = preload("res://Pages/Data Editors/Item Editor/Item Editor.tscn")

# Get display cards
func getDeckDisplay() -> Control: return DECK_DISPLAY.instantiate()
func getCardDisplay() -> Control: return CARD_DISPLAY.instantiate()
func getItemDisplay() -> Control: return ITEM_DISPLAY.instantiate()

# Get editor menuess
func getDeckMenu() -> Control: return DECK_MENU.instantiate()
func getDeckEditor() -> Control: return DECK_EDITOR.instantiate()
func getCardEditor() -> Control: return CARD_EDITOR.instantiate()
func getItemEditor() -> Control: return ITEM_EDITOR.instantiate()

## Change root scene
func changeSceneTo(newScene: PackedScene):
	if newScene: get_tree().change_scene_to_packed(newScene)
	else: printerr("Failed to change scene")
