//sprite_width=128;
//sprite_height=128;


y_speed += player_gravity;

if(x+x_speed<0 ||x+x_speed>room_width-64){
	x_speed*=-1.2;
	remainder_x=0;
	move_x=0;
	if(!audio_is_playing(wall_bounce)){
		audio_play_sound(wall_bounce,1,false);
	}
	
}

x+=move_x;
y_speed += player_gravity;
x_speed*=0.9;

remainder_x+=x_speed;
remainder_y+=y_speed;

move_x=round(remainder_x);
move_y=round(remainder_y);

remainder_x-=move_x;
remainder_y-=move_y;

if(player_state==state.dead){
	respawn_timer++;
	if(respawn_timer>=respawn_time){
		respawn_timer=0;
		respawn_time=random_range(1*room_speed,2*room_speed);
		player_state=state.alive;
		Respawn();
	}
}

var new_y = y+move_y;
for(var i=0; i<abs(move_y); i++){
	new_y = y + sign(move_y);
	var platform_collide_with = instance_place(x,new_y,obj_platform);
	//var player_collide_with = instance_place(x,new_y,obj_player);
	
	//hit the platform
	if(move_y>0){
		if(platform_collide_with!=noone){
			if(y<=platform_collide_with.y && platform_collide_with.is_intact && player_state==state.alive){
				y_speed=jump_vel;
				move_y=jump_vel;
				remainder_y=0;
				platform_collide_with.OnBounced();	
				audio_play_sound(cloud_bounce_01,1,false);
				y=new_y;
				break;
			}
		}
		
		if(y<other_player.y && other_player.player_state==state.alive){
			if(other_player.y-y<=70 && abs(x-other_player.x)<=70){
				y_speed=jump_vel;
				move_y=jump_vel;
				remainder_y=0;
				y=new_y;
				player_score++;
				other_player.player_state=state.dead;
				other_player.y_speed=15;
				other_player.remainder_y=0;
				audio_play_sound(player_bounce,1,false);
				for(var i=0; i<irandom_range(1,3); i++){
					pos_x=random_range(other_player.x-64,other_player.x+192);
					pos_y=random_range(other_player.y,other_player.y+64);
					GenerateDeathEffect(pos_x,pos_y);
				}
				break;
			}
		}
		/*if(player_collide_with!=noone){
			if(y<player_collide_with.y && player_collide_with.player_state==state.alive){
				y_speed=jump_vel;
				move_y=jump_vel;
				remainder_y=0;
				y=new_y;
				player_score++;
				player_collide_with.player_state=state.dead;
				player_collide_with.y_speed=15;
				player_collide_with.remainder_y=0;
				audio_play_sound(player_bounce,1,false);
				for(var i=0; i<irandom_range(1,3); i++){
					pos_x=random_range(player_collide_with.x-64,player_collide_with.x+192);
					pos_y=random_range(player_collide_with.y,player_collide_with.y+64);
					GenerateDeathEffect(pos_x,pos_y);
				}
				break;
			}
		}*/
			
	}
	y+=sign(move_y);
}

SetAnimation();

if(y>room_height){
	if(player_state==state.alive){
		player_score--;
		GenerateDeathEffect(x+64,y-80);
		audio_play_sound(fall_out,1,false);
	}
	remainder_x=0;
	remainder_y=0;
	player_state=state.dead;
}