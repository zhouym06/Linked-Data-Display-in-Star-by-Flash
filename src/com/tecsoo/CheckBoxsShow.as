
package com.tecsoo
{
	import fl.controls.CheckBox;
	import flash.display.MovieClip;
	
	import flash.text.TextField;
	import flash.events.MouseEvent;
	import flash.text.TextFormat;
	
	public class CheckBoxsShow extends MovieClip
	{
		var cbks:Array;
		var names:Array;
		public function CheckBoxsShow()
		{
			names = new Array("同分类","同发明人","同申请人","同代理人","同代理机构");
			cbks = new Array();
			for(var i:int = 1; i < 6; i++)
			{
				cbks.push(new CheckBox());
			}
			for(i = 0; i < 5; i++)
			{
				var myFormat:TextFormat = new TextFormat();//TextFormat
				myFormat.size = 18;
				myFormat.bold = true;
				//myFormat.font = "Georgia";
				cbks[i].setStyle("textFormat", myFormat);
				
				
				cbks[i].label = names[i];
				cbks[i].width = 200;

				cbks[i].selected = true;
				cbks[i].y = y + 20 * i;
				cbks[i].addEventListener(MouseEvent.CLICK,cd);
				addChild(cbks[i]);
			}
			
		}
		private function cd(e:MouseEvent) 
		{
			var cb:CheckBox = CheckBox(e.target);
//			if (cb.selected == true ) 
//			{
//				cb.label = "selected";
//			}else
//			{
//				cb.label = "Unselected";
//			}
//			cb.label = String(cbks.indexOf(cb) + 1);
			var _clicked:HoloEvent = new HoloEvent(HoloEvent.CHECK_CLICKED);
			_clicked.setNum(cbks.indexOf(cb) + 1);
			_clicked.setShowType(cb.selected);  
			dispatchEvent(_clicked);
			

		}
	}
}