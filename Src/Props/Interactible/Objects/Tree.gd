extends "res://Src/Props/Interactible/Objects/HarvestableItems.gd"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func interact():
	var cutTree = preload("res://Assets/Spritsheets/tree2.png")
	get_node("Sprite2D").set_texture(cutTree)
