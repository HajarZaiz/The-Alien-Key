//Display Inventory

if(keyboard_check(ord("I")) and !invDisplay){
	invDisplay = true;
	paused = !paused;
}

if(invDisplay){
	draw_set_alpha(0.75);
	draw_sprite(spr_InvBackground, 0, room_width/2, room_height/2);
	
	draw_sprite(spr_Inventory, 0, room_width/2, room_height/2);
	displayInventory()
	draw_set_halign(fa_center)
	draw_set_font(f_pause);
	draw_set_color(make_color_rgb(195, 219, 217));
	draw_text(room_width/2, 150, "PAUSED");
	draw_set_alpha(1.0);
}

//Pause game
if(paused){
	instance_deactivate_all(1);
}else{
	instance_activate_all();
}
