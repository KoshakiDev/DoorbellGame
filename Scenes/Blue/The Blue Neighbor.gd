extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var bellsound = $"BellSound"
onready var neighborsound = $"NeighborSound"
onready var winnersound = $"WinnerSound"
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func playNeigbhbor():
	neighborsound.play()

func playBell():
	bellsound.play()
	
func playWinner():
	winnersound.play()
