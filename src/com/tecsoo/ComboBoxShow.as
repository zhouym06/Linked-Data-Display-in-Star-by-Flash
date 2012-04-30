
package com.tecsoo
{
	import fl.data.DataProvider;
	import fl.controls.ComboBox;
	import flash.display.MovieClip;
	
	import flash.text.TextField;
	import flash.events.MouseEvent;
	import flash.events.Event;
	import flash.text.TextFormat;
	
	public class ComboBoxShow extends MovieClip
	{
		
		
		private var t:TextField;
		private var cbx:ComboBox;
		
		private var names:Array;
					
		public function ComboBoxShow(lang:int)
		{
			names = HoloConstants.comboBoxContent[lang];
			
			t = new TextField();
			t.text = HoloConstants.comboBoxTitle[lang];
			addChild(t);
			
			cbx = new ComboBox();
			//cbx.x = x + 10;
			cbx.y = y + 20;
			cbx.dataProvider = new DataProvider(names); 
			cbx.addEventListener(Event.CHANGE, changeHandler);
			addChild(cbx);
			
			//cbx.dropdownWidth = 210; 
			//cbx.width = 200;
			//cbx.prompt = "同分类"; 
			//cbx.editable = false;
			
		}
		
		private function changeHandler(event:Event):void 
		{
			var d:int = ComboBox(event.target).selectedItem.data
			var _changed:HoloEvent = new HoloEvent(HoloEvent.COMBO_CHANGED);
			_changed.setNum(d);
			dispatchEvent(_changed);
			
			cbx.selectedIndex = d - 1;
		}
	}
}