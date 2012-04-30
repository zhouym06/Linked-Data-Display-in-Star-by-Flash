
package com.tecsoo
{
	import flash.geom.Point;
	import flash.utils.ByteArray; 
	
	public class HoloUtil{
		public function HoloUtil(){		}
		
		public static function getLangIndex(lan:String):int{
			return HoloConstants.LanguageIndex.indexOf(lan,0);
		}
		public static function getObjCenter(number:int, subCenter:Point, weight:Array):Array
		{
			//To Do: weight
			var result:Array = new Array();
			var radius:Number = 200;
			var ang:int = 360 / number;
			for(var i:int = 0; i < number; i++)
			{
				var p:Point = Point.polar(radius, (i / number) * 2 * Math.PI);
				result.push(p.add(subCenter));

			}
/*			result.push(new Point(100,100));
			result.push(new Point(500,100));
			result.push(new Point(100,500));*/
			return result;
		}
		
		 public static function sOf(str:String):String{
			 return str.substr(0,HoloConstants.shortLen) + "..";
		 }
		 public static function shortOf(str:String, len:int):String{
			 return str.substr(0, len) + "..";
		 }
		
		 public static function urlencodeGB2312(str:String):String{
			var result:String ="";
			var byte:ByteArray =new ByteArray();
			byte.writeMultiByte(str,"gb2312");
			for(var i:int;i<byte.length;i++){
				result += escape(String.fromCharCode(byte[i]));
			}
			return result;
		}
		public static function urlencodeBIG5(str:String):String{
			var result:String ="";
			var byte:ByteArray =new ByteArray();
			byte.writeMultiByte(str,"big5");
			for(var i:int;i<byte.length;i++){
				result += escape(String.fromCharCode(byte[i]));
			}
			return result;
		}
		public static function urlencodeGBK(str:String):String{
			var result:String ="";
			var byte:ByteArray =new ByteArray();
			byte.writeMultiByte(str,"gbk");
			for(var i:int;i<byte.length;i++){
				result += escape(String.fromCharCode(byte[i]));
			}
			//   trace(result);
			return result;
		}
		
		//GB2312解码
		public static function urldecodeGB2312(str:String):String {
			var result:String = "";   
			var byte:ByteArray = new ByteArray();
			str = unescape(str);
			for (var i:int; i < str.length; i++) {
				byte[i] = str.charCodeAt(i);
			}
			result = byte.readMultiByte(byte.length, "gb2312");
			return result;
		}
		//BIG5解码
		public static function urldecodeBIG5(str:String):String {
			var result:String = "";   
			var byte:ByteArray = new ByteArray();
			str = unescape(str);
			for (var i:int; i < str.length; i++) {
				byte[i] = str.charCodeAt(i);
			}
			result = byte.readMultiByte(byte.length, "big5");
			return result;
		}
		//GBK解码
		public static function urldecodeGBK(str:String):String {   
			var result:String = "";   
			var byte:ByteArray = new ByteArray();
			str = unescape(str);
			for (var i:int; i < str.length; i++) {
				byte[i] = str.charCodeAt(i);
			}
			result = byte.readMultiByte(byte.length, "gbk");
			return result;
		}
	}
}
