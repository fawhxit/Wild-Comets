
#region Global Variables
	
	// Init
	game_state = GAME.INIT
	dialogue = ds_list_create()
	diai = 0
	animPlay = N
	focus = N
	focusL = N
	focusR = N
	focusM = N
	// Actor List
	actorL = ds_list_create()
	fd = 4 // Frame Delay
	
	// Images
	// Sky
	skyImg = instance_create_layer(0,0,"BG",oImage)
	skyImg.persistent = T
	
	// Backdrop
	bdImg = instance_create_layer(0,0,"BG",oImage)
	bdImg.persistent = T
	
	// Background Layer 2
	bgL2Img = instance_create_layer(0,0,"BG",oImage)
	bgL2Img.persistent = T
	
	// Background Layer 1
	bgL1Img = instance_create_layer(0,0,"BG",oImage)
	bgL1Img.persistent = T
	
	// Background
	bgImg = instance_create_layer(0,0,"BG",oImage)
	bgImg.persistent = T
	
	// Middleground
	mgImg = instance_create_layer(0,0,"MG",oImage)
	mgImg.persistent = T
	
	// Char L
	actorLeft = N
	// Char R
	actorRight = N
	
	// Foreground
	fgImg = instance_create_layer(0,0,"FG",oImage)
	fgImg.persistent = T
	
	// Global Factors
	wref = max(1,bgImg.sprite_height)
	href = max(1,bgImg.sprite_width)
	bgmxpct = MX/wref
	bgmypct = MY/href
	mwref = 1
	mhref = 1
	bgdltx = 1
	bgdlty = 1
	if(bbox_sanity(bgImg)) {
		
		mwref = max(1,bgImg.bbox_right)
		mhref = max(1,bgImg.bbox_bottom)
		bgdltx = bgImg.bbox_left
		bgdlty = bgImg.bbox_top
		
	}
	
#endregion

#region Gameplay Globals
	
	// Zoom
	zmn = 1.2
	z   = zmn
	zmx = 2.0
	zoomed = F
	zo = zmn
	
	// Hover
	isHvr = F
	hvrDel = GSPD/2
	hvrDeli = 0
	hvrPct = 0
	
	// Overrides
	ctrlOverride = F
	
#endregion

#region Dialogue Globals
	
	diaOverride = F
	diaZmn = 1
	diaZmx = 1.2
	diaDel = GSPD
	diaDeli = 0
	diaDelPct = 0
	diaDeli2 = 0
	diaDelPct2 = 0
	diaSpeaker = N
	diaNestL = ds_list_create()
	diaTranDel = GSPD*(2/3)
	diaTranDeli = 0
	diaTranPct = 0
	
#endregion

#region Scene Globals
	
	scni = -1
	scene_state = GAME.INIT
	scnBlend1 = c.wht
	scnBlend2 = c.wht
	scnBlend3 = c.wht
	scnLight = N
	scnBlendDel = GSPD/4
	scnBlendDeli = 0
	scnBlendPct = 0
	
#endregion

#region Scene Struct
	
	#macro S global.scene_struct
	S = {}
	
	// Array to Fetch Sprites w/
	fetchArr = [sprSylas1,sprSylas2,sprSylas3,sprSylas4,sprSylasBod,sprSylasBod2,sprSpitfire1,sprSpitfire2,sprSpitfireBod]
	
	// Init Scene Struct
	db_scn()
	
#endregion

#region Narrative Struct WIP
	
	#region Init
		
		#macro NS global.narrative_struct
		NS = {}
		NS[$ K.I] = 0
		NS[$ K.CAR] = 0
		NS[$ K.CAR+K.DL] = GSPD*.2
		NS[$ K.CAR+K.DLI] = 0
		
	#endregion
	
	// Init Narrative Struct
	db_diaNar()
	
#endregion

#region Contextuals Map
	
	#macro CM global.contextuals_map
	CM = U
	db_context()
	
#endregion

#region Init Char List
	
	db_act()
	
#endregion