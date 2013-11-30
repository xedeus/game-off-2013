package
{
	import citrus.core.CitrusEngine;
	import citrus.core.starling.StarlingCitrusEngine;
	
	import com.constants.Audio;
	import com.constants.Game;
	import com.events.CreateEvent;
	import com.states.CarnageProtocol;
	import com.states.LifelessProtocol;
	import com.states.MenuProtocol;
	import com.states.TerminateProtocol;
	
	import flash.events.Event;
	import flash.text.Font;
		
	[SWF(width='960', height='600', backgroundColor='#080f13', frameRate='60', pageTitle='1120')]
	
	public class Main extends StarlingCitrusEngine {
		
		[Embed(source="/com/assets/fonts/DestroyEarthBB.otf", fontName = "DestroyEarthBB",fontStyle = "Regular", mimeType="application/x-font-truetype")]
		public static const DESTROY_EARTH:Class;
		
		[Embed(source="/com/assets/fonts/DestroyEarthRoughBB.otf", fontName = "DestroyEarthRoughBB",fontStyle = "Regular", mimeType="application/x-font-truetype")]
		public static const DESTROY_EARTH_ROUGH:Class;
		
		[Embed(source="/com/assets/fonts/ProtestPaintBB.otf", fontName = "ProtestPaintBB",fontStyle = "Regular", mimeType="application/x-font-truetype")]
		public static const PROTEST_PAINT:Class;
		
		[Embed(source="/com/assets/fonts/PalookaBB.otf", fontName = "PalookaBB",fontStyle = "Regular", mimeType="application/x-font-truetype")]
		public static const PALOOKA:Class;
		
		private static var _ce:CitrusEngine = CitrusEngine.getInstance();

		public function Main() {
			 
			super();  
			this.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		}
		
		private function onAddedToStage(event:Event):void
		{
			this.removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			
			setUpStarling(false);
			_starling.stage.addEventListener(CreateEvent.CREATE, switchStates);

			sound.addSound("click", {sound: Audio.CLICK, volume: 0.6});
			sound.addSound("hit_pick", {sound: Audio.HIT_PICK, volume: 0.6});
			sound.addSound("rumble", {sound: Audio.RUMBLE});
			sound.addSound("rumble_v1", {sound: Audio.RUMBLE_V1});
			sound.addSound("lick_chord", {sound: Audio.LICK_CHORD});
			sound.addSound("drone", {sound: Audio.DRONE});
			sound.addSound("veloid2", {sound: Audio.VELOID_2, volume: 0.3});
			sound.addSound("earthrot", {sound: Audio.EARTHROT, volume: 0.05});
			sound.addSound("heart", {sound: Audio.HEART, volume: 0.1});
			sound.addSound("horror", {sound: Audio.HORROR, volume: 0.5});
			sound.addSound("warkle", {sound: Audio.WARKLE, volume: 0.6});
			
			state = new MenuProtocol();
		}

		private function switchStates(Event:CreateEvent):void
		{
			var type:String = Event.params.type
			
			if(type == Game.START || type == Game.RESTART)
				state = new CarnageProtocol();
			else if (type == Game.SPLASH)
				state = new MenuProtocol();
			else if (type == Game.EXIT)
				state = new TerminateProtocol();
			else if (type == Game.DEATH)
				state = new LifelessProtocol;
				
		}
	}
}