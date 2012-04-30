
package com.tecsoo
{
	import com.tecsoo.*;
	
	import flash.display.*;
	import flash.events.*;
	import flash.external.*;
	import flash.geom.Point;
	import flash.net.*;
	import flash.text.TextField;
	import flash.utils.Timer;
	
	public class ObjShow extends MovieClip{
		private var recallFuncClick:String;
		private var recallFuncDoubleClick:String;
		private var serverIP:String;
		
		private var subCenter:Point;
		private var objCenter:Point;
		private var objName:String;
		private var shortName:String;
		private var objRelation:String;
		private var shortRelation:String;
		private var objURI:String;
		private var objType:int;
		
		private var oTempTextField:TextField;
		private var button:SimpleButton;
		
		private var timer:Timer;
		
		//var debugger:TextField;		
//		var oTextField:TextField;
//		var rs:RelationShape;
//		var rTextField:TextField;
		
		public function ObjShow( recallFuncClick:String, recallFuncDoubleClick:String, showLength:String, subCenter:Point, objCenter:Point, 
								objName:String, objRelation:String, 
								objURI:String, objType:int){
			this.recallFuncClick = recallFuncClick;
			this.recallFuncDoubleClick = recallFuncDoubleClick;
			this.serverIP = serverIP;
			
			this.subCenter = subCenter;
			this.objCenter = objCenter;
			this.objName = objName;
			this.shortName = HoloUtil.shortOf(objName, (int(showLength)));
			this.objRelation = objRelation;
			this.shortRelation = HoloUtil.shortOf(objRelation, (int(showLength)));
			this.objURI = objURI;
			this.objType = objType;
			
			/*
			debugger = new TextField();
			debugger.wordWrap = true;
			debugger.multiline = true;
			debugger.width = 300;
			debugger.height = 100;
			debugger.text = "de:";
			debugger.x = objCenter.x - 50;
			debugger.y = objCenter.y - 100;
			addChild(debugger);*/
			
			
			timer = new Timer(250,1);
			timer.addEventListener(TimerEvent.TIMER, timerHandler);
			
			
			oTempTextField = new TextField();
			oTempTextField.text = objName;
			oTempTextField.wordWrap = true;
			oTempTextField.multiline = true; //允许多行
			oTempTextField.width = 300;

			oTempTextField.visible = false;
			oTempTextField.selectable = false;
			oTempTextField.x = objCenter.x  - 6 * objName.length;
			oTempTextField.y = objCenter.y - 40;
			//oTempTextField.textColor = 0x000000;
			
			
			
			switch(objType)
			{
				case 1:
					button = new OvalButtonsBlue();
					break;
				case 2:
					button = new OvalButtonsGreen()
					break;
				case 3:
					button = new OvalButtonsOrange()
					break;
				case 4:
					button = new OvalButtonsYellow()
					break;
				default:
					button = new OvalButtonsRed();
			}
			button.x = objCenter.x;		
			button.y = objCenter.y;
			button.doubleClickEnabled = true;
			
			
			button.addEventListener(MouseEvent.MOUSE_UP, clickButton);
			//button.addEventListener(MouseEvent.DOUBLE_CLICK, doubleClickButton);
			
			button.addEventListener(MouseEvent.MOUSE_OVER, onButton);
			button.addEventListener(MouseEvent.MOUSE_OUT, outButton);
			
		}
		/*
		private function clickButton(e:HoloEvent):void {
			ExternalInterface.call(recallFuncClick, objURI);
		}
		private function doubleClickButton(e:HoloEvent):void {
			ExternalInterface.call(recallFuncDoubleClick, objURI);
		}*/
		
		private function clickButton(e:MouseEvent):void {
			if(timer.running){
				//debugger.appendText("clicked Running (double)\n");
				timer.stop();
				ExternalInterface.call(recallFuncDoubleClick, objURI);//双击响应
			}else{
				//debugger.appendText("clicked Stopped (start)\n");
				timer.start();
			}
		}
		private function timerHandler(event:TimerEvent):void
		{
			//debugger.appendText("Time Out (click)\n");
			ExternalInterface.call(recallFuncClick, objURI);//单击响应
		}
		
		private function onButton(e:MouseEvent):void {
			oTempTextField.visible = true;
		}
		private function outButton(e:MouseEvent):void {
			oTempTextField.visible = false;
		}
		
		
		
		public function getURI():String
		{
			return objURI;
		}
		public function getName():String
		{
			return objName;
		}
		public function getOButton():SimpleButton
		{
			return button;
		}
		public function getOTempTextField():TextField
		{
			return oTempTextField;
		}
		public function getOTextField():TextField
		{
			var oTextField:TextField = new TextField();
			oTextField.text = shortName;
			oTextField.selectable = false;
			oTextField.x = objCenter.x - 6 * shortName.length;
			oTextField.y = objCenter.y + 15;
			//oTextField.textColor = 0xff0000;
			oTextField.mouseEnabled = false;
			oTextField.mouseWheelEnabled = false;
			return oTextField;
		}
		public function getRelationShape():RelationShape
		{
			return (new RelationShape(subCenter, objCenter, objType, objRelation));
		}
		public function getRTextField():TextField
		{
			var rTextField:TextField = new TextField();
			rTextField.text = shortRelation;
			rTextField.selectable = false;
			rTextField.x = (objCenter.x + subCenter.x) / 2 - 6 * shortRelation.length;
			rTextField.y = (objCenter.y + subCenter.y) / 2;
			//rTextField.textColor = 0xff0000;
			return rTextField;
		}
		
		
	}
}