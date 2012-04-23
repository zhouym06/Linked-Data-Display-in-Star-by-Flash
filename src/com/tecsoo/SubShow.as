
package com.tecsoo
{
	import flash.display.Graphics;
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.external.*;
	import flash.geom.Point;
	import flash.net.*;
	import flash.text.TextField;
	
	public class SubShow extends MovieClip {
		var sTempTextField:TextField;
		var recallFuncClick:String;
		var recallFuncDoubleClick:String;
		var subURI:String;
		public function SubShow(recallFuncClick:String, recallFuncDoubleClick:String, showLength:String, subCenter:Point, subName:String, subURI:String) {
			
			this.recallFuncClick = recallFuncClick;
			this.recallFuncDoubleClick = recallFuncDoubleClick;
			this.subURI = subURI;
			
			var shortSub:String = HoloUtil.shortOf(subName, parseInt(showLength));
			
			var t:TextField = new TextField();
			t.selectable = false;
			t.text = shortSub;
			t.x = subCenter.x - 6 * shortSub.length
			t.y = subCenter.y + 20;
			//t.textColor = 0xff0000;
			addChild(t);
			
			sTempTextField = new TextField();
			sTempTextField.selectable = false;
			sTempTextField.text = subName;
			sTempTextField.wordWrap = true;
			sTempTextField.multiline = true;
			sTempTextField.width = 300;
			
			sTempTextField.x = subCenter.x - 6 * subName.length
			sTempTextField.y = subCenter.y - 30;
			//sTempTextField.textColor = 0x000000;
			sTempTextField.visible = false;
			addChild(sTempTextField);
			
			
			
			
			var b = new OvalButtonsRed();
			b.x = subCenter.x;
			b.y = subCenter.y;
			b.addEventListener(MouseEvent.CLICK, clickButton);
			b.addEventListener(MouseEvent.MOUSE_OVER, onButton);
			b.addEventListener(MouseEvent.MOUSE_OUT, outButton);
			addChild(b);
		}
		
		private function clickButton(e:MouseEvent):void {
			//var b:SimpleButton=e.target as SimpleButton;
			//var _clicked:HoloEvent = new HoloEvent(HoloEvent.PACK_UP);
			//dispatchEvent(_clicked);
			ExternalInterface.call(recallFuncDoubleClick, subURI);//双击响应
			//ExternalInterface.call(recallFunc, "From Flash : " + subURI);
			//navigateToURL(new URLRequest("http://www.holosoo.com/detail?an=" + subURI));
		}
		
		private function onButton(e:MouseEvent):void {
			sTempTextField.visible = true;
		}
		private function outButton(e:MouseEvent):void {
			sTempTextField.visible = false;
		}
	}
}