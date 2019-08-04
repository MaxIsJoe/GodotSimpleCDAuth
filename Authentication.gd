extends Node2D

onready var Status = $Status

###Variables###
var SubmittedCode = ""
var FileContent = "d"
var ConnectionResult 
###Signals###
signal YouShallPass #Used to allow the user to play the game after they succsfully activated their game

###HTTPRequest Logic###
func _on_HTTPRequest_request_completed(result, response_code, headers, body): #Used to do stuff after a file has been downloaded
	var content = body.get_string_from_utf8() #Converts the file from a PoolByte to a normal string that we can read
	FileContent = content #We set the FileContent variable to the content we got from online so we can accses it from another function later
	ConnectionResult = result #Used for error checking later
	print(result)
	print(content)


###UI Logic###
func _on_TextEdit_text_changed(): #Used to keep track of what the user Input inside the TextEdit node
	var txt = get_node("TextEdit")
	SubmittedCode = txt.get_text()
	print(SubmittedCode)
	

func _on_Activate_button_down():
	if(FileContent.similarity(SubmittedCode) >= 0.2): #Checks how similar is the CD code to the ones online
		emit_signal("YouShallPass") #It's valid
		self.hide()
		print(true)
	#Error Checking
	elif(ConnectionResult == 2): #If the user can't connect connect to the host who has the keys
		Status.set_bbcode("[center][color=#FF0000]Failed to connect to servers[/color][/center]")
	elif(SubmittedCode == ""): 
		Status.set_bbcode("[center][color=#FF0000]Your CD key can't be blank[/color][/center]")
	elif(FileContent.similarity(SubmittedCode) >= -1):
		Status.set_bbcode("[center][color=#FF0000]Please Enter a vaild CD key[/color][/center]")