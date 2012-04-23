package com.tecsoo
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.*;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import flash.text.TextField;
	
	public class GainFader extends theGainFader //implements IEventDispatcher
	{
//		private var _dispatcher:EventDispatcher;
//		public static const BUTTON_MOVED:String = "moved";
		
		var top:Number;
		var left:Number;
		var right:Number;
		var bottom:Number;
		var level:Number;
		//var t:TextField;

		public function GainFader() {
			//_dispatcher = new EventDispatcher(this);
			//this.t = new TextField();
			//t.text = "inited";
			//addChild(t);
		}
		public function initBoundary(){
			this.top = this.y;
			//this.top = this.y - 160;
			this.left = this.x;
			this.right = this.x;
			this.bottom = this.y + 200;
			//this.bottom = this.y;
			this.level = 100;
			addEventListener(MouseEvent.MOUSE_UP, mUp);
			//addEventListener(MouseEvent.MOUSE_OUT, mUp);
			addEventListener(MouseEvent.MOUSE_DOWN, mDown);
			
		}/*
		public function setTextField(t:TextField):void
		{
			this.t = t;
		}*/
		private function mDown(evt:MouseEvent):void{
			var rect:Rectangle=new Rectangle(left, top, right, bottom - 40)
			startDrag(false,rect);
		}
 
		private function mUp(evt:MouseEvent):void{
			stopDrag();
			renewNum();
		}
		private function renewNum():void
		{
			//换回来了
			var num:int = int(HoloConstants.minObjNum + (HoloConstants.maxObjNum - HoloConstants.minObjNum) * (this.y - bottom) / (top - bottom));
			//var num:int = int(HoloConstants.minObjNum + (HoloConstants.maxObjNum - HoloConstants.minObjNum) * (top - this.y) / (top - bottom));
			//t.text = "num:" + String(num) + " y:" + String(this.y) + " top:" + String(top) + " bottom:" + String(bottom);
			//t.text = String(int(HoloConstants.minObjNum + (HoloConstants.maxObjNum - HoloConstants.minObjNum) * (top - this.y) / (top - bottom)));
			var _moved:HoloEvent = new HoloEvent(HoloEvent.FADER_MOVED);
			_moved.setNum(num);
			dispatchEvent(_moved);
		}
		public function weightChanged(evt:HoloEvent):void
		{
			trace("GainFader:weightChanged");
			if(evt.getIsPlus())
			{
				y = (y - 20) < top ? top : (y - 20);
			}else{
				y = (y + 20) > bottom ? bottom : (y + 20);
			}
			renewNum();
		}
		/*
		override public function addEventListener(type:String, listener:Function, 
										 useCapture:Boolean = false, priority:int = 0, 
										 useWeakReference:Boolean = false):void
		{
			_dispatcher.addEventListener(type,listener,useCapture,priority,useWeakReference);
		}
		override public function dispatchEvent(evt:Event):Boolean
		{
			return _dispatcher.dispatchEvent(evt);
		}
		override public function hasEventListener(type:String):Boolean
		{
			return _dispatcher.hasEventListener(type);
		}
		override public function removeEventListener(type:String, listener:Function, useCapture:Boolean = false):void
		{
			_dispatcher.removeEventListener(type,listener,useCapture);
		}
		override public function willTrigger(type:String):Boolean
		{
			return _dispatcher.willTrigger(type);
		}*/
	}
}