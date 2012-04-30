
package com.tecsoo
{
	public class HoloConstants
	{
		public static const shortLen:int = 2;
		public static const minObjNum:int = 3;
		public static const maxObjNum:int = 20;
		
		public static const LanguageIndex:Array = new Array(
			"zh","us"
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
				{label:"Same Agent", data:"4"}, 
				{label:"Same Agency", data:"5"} ]
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
	}
}