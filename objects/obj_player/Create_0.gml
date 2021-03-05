enum state{
	dead, alive
}

player_gravity= 0.6;
jump_vel = -28.0;
x_acc = 2.0; 

x_speed=0.0;
y_speed=0.0;

remainder_x=0;
remainder_y=0;
move_x=0;
move_y=0;


jump_left_spr=noone;
jump_right_spr=noone;
fall_left_spr=noone;
fall_right_spr=noone;
die_spr=noone;

current_spr=jump_left_spr;

player_score=0;

//by default, both players are dead
player_state=state.dead;

respawn_time=random_range(1*room_speed,2*room_speed);
respawn_timer=0;


image_speed=1;
image_index=0;



//respawn the player ("shoot" them to the game, with a random x_speed)
function Respawn(){
	remainder_x=0;
	remainder_y=0;
	move_x=0;
	move_y=0;
	var spawn_x = random_range(0,room_width - 64);
	x=spawn_x;
	y=room_height-5;
	
	facing = irandom_range(0,1);
	facing = facing==0 ?-1:1;
	
	x_speed=facing*random_range(30,40);
	y_speed=random_range(-50,-45);
	audio_play_sound(respawn,1,false);
	
}

function SetAnimation(){
if(player_state==state.alive){
	if(x_speed>0){ //right
		if(y_speed<0){ //up
			if(current_spr!=jump_right_spr){
				current_spr=jump_right_spr;
				sprite_index=jump_right_spr;
				image_speed=1;
				image_index=0;
			}
		}else{ //down
			if(current_spr!=fall_right_spr){
				current_spr=fall_right_spr;
				sprite_index=fall_right_spr;
				image_speed=1;
				image_index=0;
			}
		}
	}else{ //left
		if(y_speed<0){ //up
			if(current_spr!=jump_left_spr){
				current_spr=jump_left_spr;
				sprite_index=jump_left_spr;
				image_speed=1;
				image_index=0;
			}
		}else{ //down
			if(current_spr!=fall_left_spr){
				current_spr=fall_left_spr;
				sprite_index=fall_left_spr;
				image_speed=1;
				image_index=0;
			}
		}
	
	}
}else{
	current_spr=die_spr;
	sprite_index=die_spr;
	image_speed=1;
	image_index=0;
}

}

function GenerateDeathEffect(posX,posY){
	instance_create_layer(posX,posY,"Instances",obj_death_effect);
}