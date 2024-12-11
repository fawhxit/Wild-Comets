/// @description Draw and Logix
try { /* GMLive Call */ if (live_call()) return live_result; } catch(_ex) { /* GMLive not available? */ }

var ao = draw_get_alpha()
draw_set_alpha(fade/(GSPD*2))
draw_rectangle_color(0,0,WW,WH,c.blk,c.blk,c.blk,c.blk,F)
draw_set_font(fTitle)
draw_set_hvalign([fa_center,fa_middle])
draw_text_transformed_color(WW/2,WH/2,"Weeks Earlier",(WW/string_width("Weeks Earlier"))*(2/3),(WW/string_width("Weeks Earlier"))*(2/3),0,c.wht,c.wht,c.lgry,c.lgry,fade/(GSPD*2))
if(del > 0) del--;
if(fade > 0 and del <= 0) fade--;
if(fade <= 0) {
    
    D.fd = GSPD*2
    D.diaOverride = F
    instance_destroy(id)
    
}
draw_set_alpha(ao)