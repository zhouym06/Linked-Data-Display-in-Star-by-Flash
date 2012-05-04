

package com.tecsoo
{
	import flash.display.MovieClip;
	import flash.display.SimpleButton;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.external.*;
	import flash.geom.Point;
	import flash.text.TextField;
	
	
	public class HoloShow extends MovieClip{
		private var recallFuncClick:String;
		private var recallFuncDoubleClick:String;
		private var showLength:String;
		private var subName:String;
		private var subCenter:Point;
		private var subURI:String;
		private var objNames:Array;
		private var objRelations:Array;
		private var objURIs:Array;
		private var objWeight:Array;
		private var objType:Array;
		private var objNumber:int;
		
		private var objs:Array;
		private var showType:int;
		private var lastNum:int;
		private var objInType:Array;
		
		private var pack:Boolean;
		private var history:Array;
		//var debugger:TextField;
		
		public function HoloShow()
		{
			pack = false;
			showType = 1;
			history = new Array();
		}
		
		public function renew(recallFunc1:String, recallFunc2:String, showLength:String, subName:String, subCenter:Point, subURI:String, objNamesArray:String, objRelationsArray:String, objURIsArray:String, objWeightsArray:String, objTypesArray:String):void
		{
			this.recallFuncClick = recallFunc1;
			this.recallFuncDoubleClick = recallFunc2;
			this.showLength = showLength;
			
			this.subName = subName;
			this.subCenter = subCenter;
			this.subURI = subURI;
			
			objNames = objNamesArray.split(HoloConstants.seperator);
			objRelations = objRelationsArray.split(HoloConstants.seperator);
			objURIs = objURIsArray.split(HoloConstants.seperator);
			objWeight = objWeightsArray.split(HoloConstants.seperator);
			objType = objTypesArray.split(HoloConstants.seperator);
			
			objNumber = objNames.length;
			
			lastNum = objNumber;
			
			
			objInType = new Array();
			for(var i:int = 0; i < 6; i++)
			{
				objInType.push(new Array());
			}
			for(i = 0; i < objNumber; i++)
			{
				objInType[(int(objType[i]))].push(i);
			}
			for(i = 0; i < 6; i++)
			{
				objInType[i].sort(wComparer);
			}
			
			
			history.push(subURI);
			if(history.length > 10)
				history.splice(0,1);
			
			
			
		}
		private function wComparer(a:int, b:int):int
		{
			if(Number(objWeight[a]) < Number(objWeight[b]))
			{
				return -1;
			}else if(Number(objWeight[a]) > Number(objWeight[b])){
				return 1;
			}else{
				return 0;
			}
		}
		
		public function paint(showNumber:int):void
		{
			
			while(numChildren > 0)
			{
				removeChildAt(0);
			}

			var subShow:MovieClip = new SubShow(recallFuncClick, recallFuncDoubleClick, showLength, subCenter, subName, subURI);
			subShow.addEventListener(HoloEvent.PACK_UP, subClicked);
			if(pack)
			{
				addChild(subShow);
				return;
			}
			
			
			//get paintNumber of each type
			var count:int = showNumber;
			if (showNumber > objInType[showType].length)
				count = objInType[showType].length;
			var posHolder:int = count;
			for(var i:int = 0; i < count; i++)
			{
				if(subURI.substr(0,15) == String(objURIs[objInType[showType][i]]).substr(0,15))
					posHolder--;
			}
			var objCenters:Array = HoloUtil.getObjCenter(posHolder, subCenter, objWeight);
			
			objs = new Array();
			for(i = 0; i < count; i++)
			{
				var oIndex:int = objInType[showType][i];
				if(subURI.substr(0,15) != String(objURIs[oIndex]).substr(0,15))
				{
					objs.push(new ObjShow(recallFuncClick, recallFuncDoubleClick, showLength, subCenter, objCenters[posHolder - 1], 
											objNames[oIndex], objRelations[oIndex], objURIs[oIndex], objType[oIndex]));
					posHolder--;
				}
			}
			
			
			for each(var k:MovieClip in objs)
			{
				addChild(k.getOTempTextField());
				addChild(k.getRTextField());
				addChild(k.getOTextField());
			}
			addChild(subShow);
			for each(k in objs)
			{
				addChild(k.getRelationShape());
				addChild(k.getOButton());
				//del this
				addChild(k);
				//
			}
			
			
			lastNum = showNumber;
			
			
			/*
			debugger = new TextField();
			debugger.wordWrap = true;
			debugger.multiline = true;
			debugger.width = 300;
			debugger.height = 100;
			debugger.text = "history:" + history.length;
			for each(k in history) 
			{
				debugger.appendText(" ");
				debugger.appendText(String(k));
			}
			debugger.x = 250;	
			debugger.y = 10;
			addChild(debugger);*/
			
		}/*
		private function getObjects():void//:Array
		{
			//showType[]
			//showNumber
			//objType:Array
			//objWeight:Array
			return ;
		}*/
		public function historyIsEmpty():Boolean
		{
			if(history.length <= 1)
				return true;
			else
				return false;
		}
		
		public function goBack(evt:MouseEvent):void
		{
			//debugger.text = "poped";
			if(historyIsEmpty())
			{
				return;
			}
			else
			{
				history.pop();
				ExternalInterface.call(recallFuncDoubleClick, history.pop());
			}
		}
		public function zoomIn(evt:MouseEvent):void
		{
			x -= 0.125 * width;
			y -= 0.125 * height;
			scaleX *= 1.25;
			scaleY *= 1.25;
		}
		public function zoomOut(evt:MouseEvent):void
		{
			x += 0.1 * width;
			y += 0.1 * height;
			scaleX *= 0.8;
			scaleY *= 0.8;
		}
		public function zoomWheel(e:MouseEvent):void
		{
            if(e.delta > 0){
				x -= 0.125 * width;
				y -= 0.125 * height;
				scaleX *= 1.25;
				scaleY *= 1.25;
			}else{
				x += 0.1 * width;
				y += 0.1 * height;
				scaleX *= 0.8;
				scaleY *= 0.8;
            }
        }

		public function subClicked(evt:HoloEvent):void
		{
			trace("HoloShow::subClicked!!!");
			pack = (!pack);
			paint(lastNum);
			
		}
		public function showTypeChanged(evt:HoloEvent):void
		{
			trace("HoloShow::ShowTypeChanged!!!");
			showType = evt.getNum();
			paint(lastNum);
			
		}
		public function moved(evt:HoloEvent):void
		{
			trace("HoloShow::moved!!!");
			paint(evt.getNum());
			lastNum = evt.getNum();
		}
		public function getLastNum():int
		{
			return lastNum;
		}
		public function getObjs():Array
		{
			return objs;
		}
	}
}