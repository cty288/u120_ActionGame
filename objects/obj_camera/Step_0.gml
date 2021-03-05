target_cam_y = room_height/3;//default
if(p1!=noone && p2!=noone){
	cam_y_1 = p1.y - (0.3*camera_get_view_height(view_camera[0]));
	cam_y_2 = p2.y - (0.3*camera_get_view_height(view_camera[0]));
	
	if(p1.y<=room_height && p2.y<=room_height){ //both alive
		target_cam_y = (cam_y_1+cam_y_2)/2;
	}else{
		if(p1.y>room_height && p2.y>room_height){ //both dead
			target_cam_y = room_height/3;
		}else if(p1.y>room_height){	//p1 died but p2 alive
			target_cam_y = cam_y_2;
		}else{ //p2 died but p1 alive
			target_cam_y = cam_y_1;
		}
	}
}else{
	target_cam_y = room_height/3;
}

//let the camera never move out of the room
if(target_cam_y< -room_height/3){
	target_cam_y= -room_height/3;
}

if(target_cam_y>= room_height/3){
	target_cam_y= room_height/3;
}

//lerp
camera_set_view_pos(view_camera[0],0,lerp(camera_get_view_y(view_camera[0]),target_cam_y,0.05));