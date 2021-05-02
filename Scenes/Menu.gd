extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var animator = $"Title Mover"
onready var buttonAnimator = $"ButtonPressed"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _process(delta):
	animator.play("Title Movement")

func _input(event):
	if event is InputEventKey:
		if event.pressed:
			buttonAnimator.play("ButtonPressed")

func _on_Button_pressed():
	buttonAnimator.play("ButtonPressed")
	
func sceneMove():
	get_tree().change_scene("res://Scenes/Main.tscn")
