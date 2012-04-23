
package com.tecsoo
{
	import flash.events.Event;
	public class HoloEvent extends Event{
		public static const FADER_MOVED:String = "fader_moved";
		public static const CHECK_CLICKED:String = "check_clicked";
		public static const COMBO_CHANGED:String = "combo_changed";
		public static const WEIGHT_CHANGED:String = "weight_changed";
		public static const GOTO_NEW_OBJECT:String = "goto_new_object"
		public static const PACK_UP:String = "pack_up";
		
		public static const OBJ_CLICKED:String = "obj_clicked";
		public static const OBJ_DOUBLE_CLICKED:String = "obj_double_clicked";
		
		private var num:int;
		private var showType:Boolean;
		private var isPlus:Boolean;
		private var url:String;
		
		public function HoloEvent(evt:String)
		{ 
			super(evt);
		}
		public function setNum(i:int):void
		{
			num = i;
		}
		public function getNum():int
		{
			return num;
		}

		public function setShowType(i:Boolean):void
		{
			showType = i;
		}
		public function getShowType():Boolean
		{
			return showType;
		}
		public function setIsPlus(i:Boolean):void
		{
			isPlus = i;
		}
		public function getIsPlus():Boolean
		{
			return isPlus;
		}
		public function setObjURL(s:String):void
		{
			url = s;
		}
		public function getObjURL():String
		{
			return url;
		}

	}
}