/// @description Fade + Logic
try { /* GMLive Call */ if (live_call()) return live_result; } catch(_ex) { /* GMLive not available? */ }
if(!done and to_scni != N) {
	
	#region To Scene
		
		override = T
		D.ctrlOverride = T
		if(deli < del) deli++;
		else if(deli >= del) {
			
			D.scene_state = GAME.INIT
			D.scni = to_scni
			done = T
			to_scni = N
			
		}
		deli = clamp(deli,0,del)
		delpct = deli/del
		
	#endregion
	
} else if(!done and to_anim != N) {
	
	#region To Anim
		
		override = T
		D.ctrlOverride = T
		if(deli < del) deli++;
		else if(deli >= del) {
			
			D.scene_state = GAME.INIT
			D.animPlay = to_anim
			done = T
			to_anim = N
			
		}
		deli = clamp(deli,0,del)
		delpct = deli/del
		
	#endregion
	
} else if(!done and from_anim != N) {
	
	#region From Anim
		
		override = T
		D.ctrlOverride = T
		if(deli < del) deli++;
		else if(deli >= del) {
			
			NS[$ K.I] = 0
			D.animPlay = N
			instance_destroy(from_anim)
			done = T
			from_anim = N
			
		}
		deli = clamp(deli,0,del)
		delpct = deli/del
		
	#endregion
	
} else if(done and deli > 0) {
	
	#region Fade In (Universal)
		
		if(to_scni != N or to_anim != N or from_anim != N) done = F;
		deli--
		delpct = deli/del
		
	#endregion
	
} else if(done and deli == 0) {
	
	done = F
	D.ctrlOverride = F
	override = F
	zXYpct = N
	
}

// Fade Draw
if(zXYpct != N) {
	
	D.z = lerp(D.zo,D.zo*zmt,delpct)
	if(done) zXYpct = [MXPCT,MYPCT];
	
}
draw_set_alpha(delpct)
draw_rectangle_color(0,0,WW,WH,c.blk,c.blk,c.blk,c.blk,F)