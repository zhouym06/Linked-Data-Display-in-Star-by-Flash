
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
		
		
		var t:TextField;
		var cbx:ComboBox;
		
		var names:Array = 
					[{label:"同分类", data:"1"}, 
					 {label:"同发明人", data:"2"}, 
					 {label:"同申请人", data:"3"}, 
					 {label:"同代理人", data:"4"}, 
					 {label:"同代理机构", data:"5"} ];
					
		public function ComboBoxShow()
		{
			t = new TextField();
			t.text = "语义类型";
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
		
		function changeHandler(event:Event):void 
		{
			var d:int = ComboBox(event.target).selectedItem.data
			var _changed:HoloEvent = new HoloEvent(HoloEvent.COMBO_CHANGED);
			_changed.setNum(d);
			dispatchEvent(_changed);
			
			cbx.selectedIndex = d - 1;
		}
	}
}