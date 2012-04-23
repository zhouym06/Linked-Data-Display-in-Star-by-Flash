package com.tecsoo
{
	import flash.display.MovieClip;
	import flash.display.SimpleButton;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	import flash.text.TextField;
	
	public class FaderGain extends theFaderGain
	{
		var t:TextField;
		var gButton:GainFader;
		//var tBox:FaderInputbox;
		public function FaderGain() {
			
			t = new TextField();
			t.text = "关联数量";
			t.x = x - 20;
			t.y = y - 20;
			addChild(t);
			
			/*tBox = new FaderInputbox();
			tBox.x = this.x;
			tBox.y = this.y + 20;
			//addChild(tBox);*/
			
			gButton = new GainFader();
			gButton.x = this.x;
			gButton.y = this.y + 35;
			//gButton.y = this.y + 195;
			
			gButton.initBoundary();
			//gButton.setTextField(tBox.getTextField());
			addChild(gButton);
			
			var plusButton:SimpleButton = new CircleBubbleBluePlus();
			plusButton.scaleX = 0.4;
			plusButton.scaleY = 0.4;
			plusButton.scaleZ = 0.4;
			plusButton.x = x ;
			plusButton.y = y + 10;
			plusButton.addEventListener(MouseEvent.CLICK, plus);
			addChild(plusButton);
			
			var minusButton:SimpleButton = new CircleBubbleBlueMinus();
			minusButton.scaleX = 0.4;
			minusButton.scaleY = 0.4;
			minusButton.scaleZ = 0.4;
			minusButton.x = x ;
			minusButton.y = y + 245;
			minusButton.addEventListener(MouseEvent.CLICK, minus);
			addChild(minusButton);
		}
		private function plus(evt:MouseEvent):void
		{
			var _plus:HoloEvent = new HoloEvent(HoloEvent.WEIGHT_CHANGED);
			_plus.setIsPlus(true);
			dispatchEvent(_plus);
			;
		}
		private function minus(evt:MouseEvent):void
		{
			var _minus:HoloEvent = new HoloEvent(HoloEvent.WEIGHT_CHANGED);
			_minus.setIsPlus(false);
			dispatchEvent(_minus);
		}
		public function getGButton():GainFader
		{
			return gButton;
		}
		/*public function getDispNum():int
		{
			return int(tBox.getTextField().text);
		}*/

	}
}