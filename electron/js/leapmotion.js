//require('leapjs-plugins')
var Leap = require('leapjs');

function concatData(id, data) {
	return id + ": " + data + "<br>"
}

function getFingerName(fingerType) {
	switch(fingerType) {
		case 0:
			return 'Thumb';
			break;
		case 1:
			return 'Index';
			break;
		case 2:
			return 'Middle';
			break;
		case 3:
			return 'Ring';
			break;
		case 4:
			return 'Pinky';
			break;
	}
}

function concatJointPosition(id, position) {
	return id + ": " + position[0] + ", " + position[1] + ", " + position[2] + "<br>";
}

var leapOutput = document.getElementById('leapData')
var frameString = "", handString = "", fingerString = "";
var hand, finger;

var options = { enableGestures: true };

//main loop
Leap.loop(function(frame) {
	frameString = concatData("frame_id", frame.id);
	frameString += concatData("num_hands", frame.hands.length);
	frameString += concatData("num_fingers", frame.fingers.length);
	frameString += "<br>"

	if(frame.hands.length > 0){
		hand = frame.hands[0];
		handString = concatData("confidence (close to 1 is better)", hand.confidence);
		handString = concatData("palm normal", hand.palmNormal);
		handString += "<br>";

		fingerString = concatJointPosition("finger_thumb_dip", hand.thumb.dipPosition);
		for(var i = 0, len = hand.fingers.length; i < len; i++){
			finger = hand.fingers[i];
			fingerString += concatData("finger_type", finger.type) + " (" + getFingerName(finger.type) + ")";
			fingerString += concatJointPosition("finger_knuckle", finger.mcpPosition); 
			fingerString += concatJointPosition("finger_pip", finger.pipPosition); 
			fingerString += concatJointPosition("finger_dip", finger.dipPosition); 
			//fingerString += concatJointPosition("finger_tip", finger.btipPosition);
			fingerString += "<br>";
		}

		frameString += handString;
		frameString += fingerString;
	}

	leapOutput.innerHTML = frameString
});
