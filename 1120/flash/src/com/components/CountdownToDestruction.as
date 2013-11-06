package com.components
{
	import com.constants.Colors;
	import com.constants.Game;
	import com.events.ElevenTwentyEvent;
	
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.text.TextField;

	public class CountdownToDestruction extends Sprite
	{
		private var _timer:Timer;
		private var _totalTime:Number = 10000;
		private var _rate:Number = 1000;
		private var _numTimes:int = _totalTime/_rate;
		
		private var _count:int = 0;
		private var _timeRemaining:Number = _totalTime;
		
		private var _display:TextField;
		
		public function CountdownToDestruction()
		{
			super();
			this.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		}
		
		private function onAddedToStage(event:Event):void
		{
			this.removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			
			_display = new TextField(80, 40, '', "ProtestPaintBB", 32, Colors.WHITE, false);
			_display.x = 320;
			_display.y = 12;
			addChild(_display);
			
			initTimer();
		}
		
		public function initTimer():void
		{
			_count = 0;
			_timeRemaining = _totalTime;
			updateDisplay(_timeRemaining);
			
			_timer = new Timer(_rate, _numTimes);
			_timer.addEventListener(TimerEvent.TIMER, handleTimeEvent);
			_timer.addEventListener(TimerEvent.TIMER_COMPLETE, handleTimeDone);
			_timer.start()
		}
		
		private function updateDisplay(newTime:*):void
		{
			_display.text = (newTime/1000).toString();
		}
		
		private function handleTimeEvent(e:TimerEvent):void
		{
			_count = e.target.currentCount;
			_timeRemaining -= Math.max(0, _rate);
			updateDisplay(_timeRemaining);
				
			// trace("_count: " + _count)
			// trace("_timeRemaining: " + _timeRemaining);
				
		}
		
		private function handleTimeDone(e:TimerEvent):void
		{
			e.target.removeEventListener(TimerEvent.TIMER, handleTimeEvent);
			e.target.removeEventListener(TimerEvent.TIMER_COMPLETE, handleTimeDone); 
			
			if (_count == _numTimes)
				destruction();
		}
				
		private function destruction():void
		{
			// trace("******** DESTROYED")
			clear();
			initTimer();
		}
		
		public function clear():void
		{
			if (_timer && _timer.hasEventListener(TimerEvent.TIMER))
			{
				_timer.removeEventListener(TimerEvent.TIMER, handleTimeEvent);
				_timer.removeEventListener(TimerEvent.TIMER_COMPLETE, handleTimeDone);
				_timer = null;
			}
		}
	}
}