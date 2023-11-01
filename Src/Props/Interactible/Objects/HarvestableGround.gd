extends StaticBody2D
var State = "Empty"
var Growth = 0
@onready var Growing_timer = $Growingtimer

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func interact():
	
	if State == "Empty" :
		Growing_timer.start()
		var SproutSprite = preload("res://Assets/Spritsheets/plante_0.png")
		get_node("Sprite2D").set_texture(SproutSprite)
		State = "Growing"


	if State == "Done" :
		get_node("Sprite2D").set_texture(null)
		await get_tree().create_timer(0.6).timeout
		
		State = "Empty"
		Growth = 0
		

func _on_growingtimer_timeout():
	
	Growth = Growth + 1
	print(Growth)
	
	if Growth == 1 :
		var PlantSprite = preload("res://Assets/Spritsheets/plante1.png")
		get_node("Sprite2D").set_texture(PlantSprite)
	
	
	if Growth == 2 :
		var PlantSprite = preload("res://Assets/Spritsheets/plant2.png")
		get_node("Sprite2D").set_texture(PlantSprite)
	
	if Growth == 3 :
		Growing_timer.stop()
		var PlantSprite = preload("res://Assets/Spritsheets/finish_palnt.png")
		get_node("Sprite2D").set_texture(PlantSprite)
		State = "Done"
