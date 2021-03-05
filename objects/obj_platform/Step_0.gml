/// @description Insert description here
// You can write your code in this editor
delete_in--;
if(delete_in==0){
	instance_destroy();
}

change_size_timer++;

if(size<=2 && is_intact){
	if(change_size_timer>=change_size_time){
		change_size_time=random_range(5,8)*room_speed;
		change_size_timer=0;
		size++;
		
		sprite_index=intact_sprites[size];
		image_speed=1;
		image_index=0;
	}
}