﻿
package com.tecsoo
{
	public class HoloConstants
	{
		public static const shortLen:int = 2;
		public static var minObjNum:int = 3;
		public static var maxObjNum:int = 20;
		public static var seperator:String = " ";
		
		public static const LanguageIndex:Array = new Array(
			"zh_CN","en"
		); 
		public static const comboBoxTitle:Array = new Array(
			"语义类型",
			"type"
			);
		public static const comboBoxContent:Array = new Array(
			[{label:"同分类", data:"1"}, 
				{label:"同发明人", data:"2"}, 
				{label:"同申请人", data:"3"}, 
				{label:"同代理人", data:"4"}, 
				{label:"同代理机构", data:"5"} ],
			[{label:"Same Category", data:"1"}, 
				{label:"Same Inventor", data:"2"}, 
				{label:"Same Applicant", data:"3"}, 
				{label:"Same Agent", data:"4"} ]
			);
		
		public static const faderGainTitle:Array = new Array(
			"关联数量",
			"show Num");
		
		public static const zoomInButton:Array = new Array(
			"放大",
			"Zoom In");
		public static const zoomOutButton:Array = new Array(
			"缩小",
			"Zoom Out");
		public static const backButton:Array = new Array(
			"后退",
			"history");
		
		
		public function HoloConstants() {}
		public static function setMaxObjNum(mon:int):void
		{
			maxObjNum = mon;
		}
		public static function setMinObjNum(mon:int):void
		{
			minObjNum = mon;
		}
		public static function setSeperator(sep:String):void
		{
			seperator = sep;
		}
		
	}
}