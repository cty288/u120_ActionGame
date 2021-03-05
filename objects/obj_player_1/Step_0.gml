if(player_state==state.alive){
	if(keyboard_check(ord("A"))){
		x_speed -= x_acc;
	}
	if(keyboard_check(ord("D"))){
		x_speed+=x_acc;
	}
}


event_inherited();

