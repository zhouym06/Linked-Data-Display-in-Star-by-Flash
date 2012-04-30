package com.tecsoo
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.external.*;
	import flash.net.*;
	import flash.system.Security;
	import flash.text.TextField;
	
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
			var local:String = stage.loaderInfo.parameters["local"];
			
			
			//var w:String = stage.loaderInfo.parameters["flashWidth"]; 
			//var h:String = stage.loaderInfo.parameters["flashHeight"]; 
			
			//Security.allowDomain("www.holosoo.com", "www.tecsoo.com", "localhost", "219.223.168.41", "219.223.168.41:8080");
			Security.allowDomain("*");
			
			ExternalInterface.addCallback("showGraph", showGraph);
			
			var ds:DataShow = new DataShow((int)(showNum), local);
			addChild(ds);
			
			var loader:URLLoader = new URLLoader(new URLRequest(dataURL));
			loader.addEventListener(Event.COMPLETE,completeHandler);
			
			function completeHandler(evt:Event):void{
				var loader2:URLLoader = URLLoader(evt.target); 
				var variables:URLVariables = new URLVariables(loader2.data); 
				ds.renew(variables, showLength, recallFunc1, recallFunc2, ((int)(showNum)));
				//trace(loader2.data); 
			}
			
			
			function showGraph(data:String):void
			{
				var variables:URLVariables = new URLVariables(data);  
				ds.renew(variables, showLength, recallFunc1, recallFunc2, ds.getLastNum() );
			}
		}
	}
}