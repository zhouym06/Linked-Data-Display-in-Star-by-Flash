package com.tecsoo
{
	import flash.display.Sprite;
	import flash.display.MovieClip;
	import flash.geom.Point;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	
	public class RelationShape extends Sprite
	{
		var subCenter:Point;
		var objCenter:Point;
		var objType:int;
		var objRelation:String;
		
		var rTextField:TextField;
		var back:Sprite
		var front:Sprite
		
		public function RelationShape(subCenter:Point, objCenter:Point, objType:int, objRelation:String) {
			this.subCenter = subCenter;
			this.objCenter = objCenter;
			this.objType = objType;
			this.objRelation = objRelation;
			
			
			rTextField = new TextField();
			rTextField.text = objRelation;
			rTextField.selectable = false;
			rTextField.x = (objCenter.x + subCenter.x) / 2 - 6 * objRelation.length;
			rTextField.y = (objCenter.y + subCenter.y) / 2 + 20;
			//rTextField.textColor = 0x000000;
			rTextField.visible = false;
			
			rTextField.wordWrap = true;
			rTextField.multiline = true; //允许多行
			rTextField.width = 300;
			
			addChild(rTextField);
			

			
			
			
			
			
			
			
			var xd:Number = objCenter.x - subCenter.x;
			var yd:Number = objCenter.y - subCenter.y;
			var zd:Number = Math.sqrt(xd * xd + yd * yd);
			var d:Number = yd / xd;
			
			var dis:Number = 30;
			var disX:Number = dis * xd / zd
			var disY:Number = dis * yd / zd
			var deltaDis:Number = 5;
			var deltaX:Number = - deltaDis * yd / zd;
			var deltaY:Number = deltaDis * xd / zd;
			var lineColor:uint  = 0xffffff;
			var outerColor:uint = 0x000000;
			switch(objType)
			{
				case 1:
					lineColor  = 0x0000ff;
					//outerColor = 0xffffff;
					break;
				case 2:
					lineColor  = 0x00ff00;
					//outerColor = 0xff00ff;
					break;
				case 3:
					lineColor  = 0xff6600;
					//outerColor = 0x0099ff;
					break;
				case 4:
					lineColor  = 0xffff00;
					//outerColor = 0x0000ff;
					break;
				default:
					lineColor  = 0xff0000;
					//outerColor = 0x00ffff;
			}
			back = new Sprite();
			back.graphics.lineStyle(7 ,outerColor,0.5);
			back.graphics.moveTo(subCenter.x + disX, subCenter.y + disY);
			back.graphics.lineTo(objCenter.x - disX, objCenter.y - disY);
			back.visible = false;
			addChild(back);

			
			front = new  Sprite();
			front.graphics.lineStyle(4,lineColor);
			front.graphics.moveTo(subCenter.x + disX, subCenter.y + disY);
			front.graphics.lineTo(objCenter.x - disX, objCenter.y - disY);
			
			front.graphics.lineStyle(3,lineColor);
			front.graphics.moveTo(subCenter.x + disX + deltaX, subCenter.y + disY + deltaY);
			front.graphics.lineTo(subCenter.x + disX - deltaX, subCenter.y + disY - deltaY);
			front.graphics.moveTo(objCenter.x - disX + deltaX, objCenter.y - disY + deltaY);
			front.graphics.lineTo(objCenter.x - disX - deltaX, objCenter.y - disY - deltaY);
			addChild(front);
			
			
			
			//paint(false);
			//this.buttonMode = true;
			//addEventListener(MouseEvent.CLICK, mOver);
			addEventListener(MouseEvent.MOUSE_OVER, mOver);
			addEventListener(MouseEvent.MOUSE_OUT, mOut);
			//addEventListener(MouseEvent.ROLL_OVER, mOver);
			//addEventListener(MouseEvent.ROLL_OUT, mOut);
			
			
		}
		public function paint(isMouseOn:Boolean):void
		{
			rTextField.visible = false;
			back.visible = false;
			if(isMouseOn)
			{
				rTextField.visible = true;
				back.visible = true;
			}
		}
		private function mOver(e:MouseEvent):void {
			graphics.clear();
			paint(true);
		}
		private function mOut(e:MouseEvent):void {
			graphics.clear();
			paint(false);
		}
				//MovieClip.addEventListener(
/*		private function 
		{
			var targetBMD:BitmapData = new BitmapData(mc.width, mc.height, true, 0x0);
			targetBMD.draw (mc, null, null, null, null, true);
			addEventListener(MouseEvent.MOUSE_OVER, onMouseOver_handler);	

		}
		private function onMouseOver_handler(event:MouseEvent):void {
			var px:int = event.currentTarget.mouseX;
			var py:int = event.currentTarget.mouseY;
			var firstPoint:Point = new Point(targetBMD.x, targetBMD.y);
			if (targetBMD.hitTest(firstPoint, 0xFF, new Point(px, py))) 
			{
				trace("响应鼠标移入事件......");   
			}
		}*/
	}
}