package com.states
{
	import citrus.core.starling.StarlingCitrusEngine;
	import citrus.core.starling.StarlingState;
	import citrus.objects.Box2DPhysicsObject;
	import citrus.objects.platformer.box2d.Hero;
	import citrus.objects.platformer.box2d.Platform;
	import citrus.objects.platformer.box2d.Sensor;
	import citrus.physics.box2d.Box2D;
	
	import com.components.GameButton;
	
	import starling.display.Button;
	import starling.display.Image;
	import starling.events.Event;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	
	public class CarnageProtocol extends StarlingState
	{
		
		public function CarnageProtocol() {
			
			trace("CARNAGE PROTOCOL")
			
			super();
		}

		override public function initialize():void {
			
			super.initialize();
			
			var box2d:Box2D = new Box2D("box2d");
			box2d.visible = true;
			add(box2d);
			
			var hero:Hero = new Hero("hero", {x:210, y:100, width:20, height:20});
			hero.acceleration = 100;
			hero.jumpAcceleration = 5;
			add(hero);
			
			/** WALLS **/
			add(new Platform("bottom", {x:stage.stageWidth / 2, y:stage.stageHeight, width:stage.stageWidth, height: 20}));
			add(new Platform("roof", {x:stage.stageWidth / 2, y:0, width:stage.stageWidth, height: 10}));
			add(new Platform("left_wall", {x:0, y: stage.stageHeight,  width:10, height: stage.stageHeight * 2}));
			add(new Platform("right_wall", {x: stage.stageWidth, y: stage.stageHeight,  width:10, height: stage.stageHeight * 2}));
			
			
			/** UI **/
			var _restartButton:Button = GameButton.textButton('X', "RESTART", 42, 40, 40, 900, 15); 
			_restartButton.addEventListener(TouchEvent.TOUCH, restartLevel);
			addChild(_restartButton);
			
			this.visible = true;
		}
		
		public function restartLevel(e:TouchEvent):void
		{
			
		}
		
	}
}