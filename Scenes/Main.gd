extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


var amount1 = Global.DOOR
var amount2 = Global.DOOR
onready var red = $"CanvasLayer/Red Neighbor/AnimationPlayer"
onready var blue = $"CanvasLayer/Blue Neighbor/AnimationPlayer"
onready var UI = $"CanvasLayer/UI"
onready var easterEgg = $"CanvasLayer/Red Neighbor"

onready var fade = $"Fade Animation"

var win1 = 0
var win2 = 0
var hasEntered1 = false
var hasEntered2 = false
# Called when the node enters the scene tree for the first time.
func _ready():
	UI.updateScore(win1, win2)
	$CanvasLayer/ColorRect.hide()
	restart()
	fade.play("Fade")

var rng = RandomNumberGenerator.new()

func setDoorValue():
	rng.randomize()
	var random_number = rng.randi_range(5, 20)
	Global.DOOR = random_number
	UI.updateMaxValue()

func restart():
	setDoorValue()
	amount1 = Global.DOOR
	amount2 = Global.DOOR
	red.play("doorClose")
	blue.play("doorClose")
	hasEntered1 = false
	hasEntered2 = false
	easterEgg.easterEgg()

func hideTutorial():
	$"CanvasLayer/Press D".hide()
	$"CanvasLayer/Press K".hide()

func hasEnteredLeft():
	if hasEntered1 == false:
		hasEntered1 = true
		red.play("doorOpen")
		win1 += 1
		
func hasEnteredRight():
	if hasEntered2 == false:
		hasEntered2 = true
		blue.play("doorOpen")
		win2 += 1

func _process(delta):
	if (amount1 <= 0 || amount2 <= 0) && (red.is_playing() == false && blue.is_playing() == false):
#		yield(get_node("Neighbors/Neighbor2/AnimationPlayer"), "animation_finished")
#		yield(get_node("Neighbors/Neighbor/AnimationPlayer"), "animation_finished")	
		if amount1 <= 0 && amount2 > 0:
			hasEnteredLeft()
		elif amount1 > 0 && amount2 <= 0:
			hasEnteredRight()
		elif hasEntered1 == false && hasEntered2 == false:
			hasEnteredLeft()
			hasEnteredRight()
		UI.updateScore(win1, win2)
		if red.is_playing() == false && blue.is_playing() == false:
			restart()
			hideTutorial()
	else:
		if Input.is_action_just_pressed("player_1_click"):
			if red.is_playing() == false:
				amount1 -= 1
				red.play("pressBellRed")
				#yield(get_node("Neighbors/Neighbor2/AnimationPlayer"), "animation_finished")
		if Input.is_action_just_pressed("player_2_click"):
			if blue.is_playing() == false:
				amount2 -= 1
				blue.play("pressBellBlue")
				#yield(get_node("Neighbors/Neighbor/AnimationPlayer"), "animation_finished")
		UI.updateProgress(amount1, amount2)


func _on_Menu_Button_pressed():
	fade.play("Back")
	
func sceneMove():
	get_tree().change_scene("res://Scenes/Menu.tscn")
