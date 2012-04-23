package com.tecsoo
{
	import flash.display.Sprite;
	import flash.text.TextField;
	import flash.net.*;
	import flash.external.*;
	import flash.system.Security;
	import flash.events.Event;
	
	[SWF(width="600", height="600", frameRate="12", backgroundColor="#C1E3FF")]
	//[SWF(width=800, height=600, frameRate=12, backgroundColor=0xFFFFFF)]
	
	public class tecsoo extends Sprite
	{
		public function tecsoo()
		{
			/*
			var t:TextField;
			t = new TextField();
			t.text = "aaa";
			addChild(t);
			*/
			var showNum:String = stage.loaderInfo.parameters["showNum"];
			var dataURL:String = stage.loaderInfo.parameters["dataURL"]; 
			var showLength:String = stage.loaderInfo.parameters["showLength"];
			var recallFunc1:String = stage.loaderInfo.parameters["recallFuncClick"]; 
			var recallFunc2:String = stage.loaderInfo.parameters["recallFuncDoubleClick"]; 
			
			
			//var w:String = stage.loaderInfo.parameters["flashWidth"]; 
			//var h:String = stage.loaderInfo.parameters["flashHeight"]; 
			
			Security.allowDomain("www.holosoo.com", "www.tecsoo.com", "zym.net9.org", "219.223.186.38");
			
			ExternalInterface.addCallback("showGraph", showGraph);
			
			var ds:DataShow = new DataShow();
			addChild(ds);
			
			var loader:URLLoader = new URLLoader(new URLRequest(dataURL));
			loader.addEventListener(Event.COMPLETE,completeHandler);
			
			function completeHandler(evt:Event):void{
				var loader2:URLLoader = URLLoader(evt.target); 
				var variables:URLVariables = new URLVariables(loader2.data); 
				ds.renew(variables, showLength, recallFunc1, recallFunc2, ((int)(showNum)));
				trace(loader2.data); 
				
			}
			
			
			function showGraph(data:String):void
			{
				var variables:URLVariables = new URLVariables(data);  
				ds.renew(variables, showLength, recallFunc1, recallFunc2, ds.getLastNum() );
			}
		}
	}
}