draw_set_font(font_gui);

var p1 = instance_find(obj_player_1,0);
var p2 = instance_find(obj_player_2,0);

draw_set_halign(fa_left);
draw_text_transformed_color(10,10,p1.player_score,1.5,1.5,0,c_blue,c_blue,c_blue,c_blue,1);

draw_set_halign(fa_right);
draw_text_transformed_color(window_get_width()-10,10,p2.player_score,1.5,1.5,0,c_green,c_green,c_green,c_green,1);