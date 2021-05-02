extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var xanthos = $"Xanthos Ware"
onready var xanthosName = $"Label"
onready var bellsound = $"BellSound"
onready var neighborsound = $"NeighborSound"
onready var winnersound = $"WinnerSound"

var rng = RandomNumberGenerator.new()
# Called when the node enters the scene tree for the first time.
func _ready():
	easterEgg()

func easterEgg():
	rng.randomize()
	var random_number = rng.randi_range(0, 20)
	if random_number == 1:
		xanthos.show()
		xanthosName.show()
	else:
		xanthos.hide()
		xanthosName.hide()

func playBell():
	bellsound.play()
	
func playNeighbor():
	neighborsound.play()
	
func winnerSound():
	winnersound.play()
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
