extends HTTPRequest

func _ready():
	self.request("https://gist.githubusercontent.com/MaxIsJoe/3a65fd2addf99724c521f94a1205ac08/raw/ff444c33880ec878e5d5b81de297f0d7e4718983/testkeys") #We Download the file here
	

