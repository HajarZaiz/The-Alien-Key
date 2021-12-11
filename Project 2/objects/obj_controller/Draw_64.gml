//Drawing Healthbar Backgound
draw_set_alpha(0.75);
draw_sprite(spr_Healthbar, 0, 100, 50);
//Drawing Health
draw_set_color(make_color_rgb(179,14,92));
draw_set_alpha(0.8);
draw_rectangle(99, 49, 99 + (lives/6)*(sprite_get_bbox_right(spr_Healthbar) - sprite_get_bbox_left(spr_Healthbar)), 49 + (sprite_get_bbox_bottom(spr_Healthbar) - sprite_get_bbox_top(spr_Healthbar)),false);
//Drawing Heart
draw_set_alpha(1);
draw_sprite(spr_InvHeart, 0, 100,  50 + (sprite_get_bbox_bottom(spr_Healthbar) - sprite_get_bbox_top(spr_Healthbar))/2);
//Draw score
draw_set_font(f_score);
draw_set_halign(fa_middle);
draw_text(170, 100, "Score: "+ string(score));


//Display Inventory

if(keyboard_check(ord("I")) and !invDisplay){
	invDisplay = true;
	paused = !paused;
}

if(invDisplay){
	draw_set_alpha(0.75);
	draw_sprite(spr_InvBackground, 0, 1920 / 2, 1080 / 2);
	
	draw_sprite(spr_Inventory, 0, 1920/2, 1080/2);
	displayInventory()
	draw_set_halign(fa_center)
	draw_set_font(f_pause);
	draw_set_color(make_color_rgb(195, 219, 217));
	draw_text(1920/2, 150, "PAUSED");
	draw_set_alpha(1.0);
}

//Pause game
if(paused){
	instance_deactivate_all(1);
}else{
	instance_activate_all();
}

if (lives <= 0) {
	draw_set_alpha(0.75);
	draw_sprite(spr_InvBackground, 0, 1920 / 2, 1080 / 2);
	draw_set_color(make_color_rgb(195, 219, 217));
	draw_set_halign(fa_center)
	draw_set_font(f_pause);
	draw_text(1920/2, 150, "Game Over\n(Press R To Restart)");
	draw_set_alpha(1.0);
}
