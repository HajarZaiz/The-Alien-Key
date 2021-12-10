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

if(room == Room1 && global.ownedKeys == 1){
	draw_sprite(spr_Key, 0, 1850, 50);
}