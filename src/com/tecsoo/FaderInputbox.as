package com.tecsoo
{
	import flash.display.MovieClip;
	import flash.text.TextField;
	public class FaderInputbox extends MovieClip
	{
		private var t:TextField;
		public function FaderInputbox() {
			t = new TextField();
			t.x = this.x - 19;
			t.y = this.y - 7.3;
			t.selectable = false;
			t.text = String(HoloConstants.minObjNum);
			t.width = 39.0;
			t.height = 14.6;
			addChild(t);
		}
		public function getTextField():TextField
		{
			return t;
		}
		
		public function setText(s:String):void
		{
			t.text = s;
		}
	}
}