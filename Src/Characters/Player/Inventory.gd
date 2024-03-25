extends Node
var inventory = []

class Item:
	var name: String
	var quantity: int
	var type: String 

	func _init(name: String, quantity: int = 1):
		self.name = name
		self.quantity = quantity

# Called when the node enters the scene tree for the first time.
func _ready():
	# Ajouter un exemple d'élément à l'inventaire au début du jeu
	#add_item('axe', 1, 'tool')
	print_inventory()
	# ...

func add_item(name: String, quantity: int, type: String):
	# Vérifie si l'objet est déjà dans l'inventaire, sinon l'ajoute
	for item in inventory:
		if item.name == name && type == 'ressource':
			item.quantity += quantity
			print_inventory()
			return

	var new_item = Item.new(name, quantity)
	inventory.append(new_item)
	print_inventory()

func remove_item(name: String, quantity: int = 1):
	for i in range(inventory.size()):
		var item = inventory[i]
		if item.name == name:
			if item.quantity <= quantity:
				inventory.remove(i)
			else:
				item.quantity -= quantity
			return
	print_inventory()

func print_inventory():
	for item in inventory:
		print(item.name + ": " + str(item.quantity))

func check_required_in_inventory(name: String):
	for item in inventory:
		if item.name == name:
			return name
	return 'null'
