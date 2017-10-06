# Framer Metadata
Framer.Info =
	title: "Main Menu"
	author: "Make on selected"

# Colours
white =  "#ECECEC"
darkgrey =  "#1E2226"

# Define Row Dimensions
height = 60
padding = 2

#card array
cards = []

# Load JSON file with movie details
menu = JSON.parse Utils.domLoadDataSync "data/MainMenu.json"

# Define Class
class Menuitem extends Layer
	constructor: (options = {}) ->
		options.width = 365
		options.height = height - padding
		super options
		bg = new Layer
			parent: @
			backgroundColor: white
			height: @.height
			width: @.width
		title = new TextLayer
			parent: @
			text: options.title
			x: 30
			y: 15
			width: 225
			height: 24
			fontFamily: "Arial"
			fontWeight: 600
			color: darkgrey
			fontSize: 22
			truncate: true
			
		title.states =
				active:
					color: white
				inactive:
					bcolor: darkgrey
		bg.states =
				active:
					color: darkgrey
				inactive:
					bcolor: white

# Create list of Menu Items
for i in [0..7]
	card = new Menuitem 
		x: 5
		y: i * height
		title: menu.menu[i].title
		
	#push card in cards array
	cards.push(card)
		
for child in cards[0].children
	child.stateSwitch "active"
