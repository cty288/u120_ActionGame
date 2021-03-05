if(player_state==state.alive){
	if(keyboard_check(vk_left)){
		x_speed -= x_acc;
	}
	if(keyboard_check(vk_right)){
		x_speed+=x_acc;
	}
}


event_inherited();

