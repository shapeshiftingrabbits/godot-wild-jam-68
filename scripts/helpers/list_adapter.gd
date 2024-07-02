extends RefCounted

class_name ListAdapter

## Gives a set of behaviors to create cells for a list of models.
## 
## Handles adding and updating cells with models.
## Initialise giving:
## - [param in_models]: [Dictionary] the models dictionary
## - [param in_list_view]: [Container] to add the cells to
## - [param cell_packed_scene]: [PackedScene], a [Container] to be instanciated to create the cell.
## 		The cell needs to have a method bind with the following parameters.
##		- [param model]: [any] the model itself that will be attached to the cell as a meta
##		[codeblock]
##			func bind( model: any):
##				pass
##		[/codeblock]


var list_view : Container
var models : Array
var cell_packed_scene: PackedScene

const MODEL_KEY = "model_key"

func _init( in_models: Array, 
			in_list_view: Container, 
			in_cell_packed_scene: PackedScene):
	models = in_models 
	list_view = in_list_view
	cell_packed_scene = in_cell_packed_scene
	create_cells()


func create_cells():
	for model in models:
		var cell = add_cell_to_list( model)
		list_view.add_child( cell)
		var item_key = model.item_key
		list_view.set_meta( item_key, cell)


## the model class needs to have a member item_key
func add_cell_to_list(model: RefCounted):
	var cell: Container = cell_packed_scene.instantiate()
	cell.set_meta(MODEL_KEY, model)
	if (!cell.has_method("bind")):
		printerr("The cell object needs a bind method, see documentation of the ListAdapter.")
	cell.bind( model)
	return cell


func update_item( model: RefCounted):
	var item_key = model.item_key
	var cell = list_view.get_meta(item_key)
	if (cell == null):
		add_cell_to_list(model)
	else:
		cell.update_amount(model)
