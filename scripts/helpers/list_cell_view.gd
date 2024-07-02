extends BoxContainer

class_name ListCellView

var model: CellModel


func bind( in_model: CellModel):
	await self.ready
	model = in_model
