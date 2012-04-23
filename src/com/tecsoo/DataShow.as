﻿package com.tecsoo
{
	import flash.display.*;
	import flash.net.*;
	import flash.external.*;
	import flash.text.*;
	import flash.geom.Point;
	import flash.events.MouseEvent;
	
	public class DataShow extends MovieClip{
		var subCenter:Point = new Point(350,300);
		
		var holoShow:MovieClip;
		var bButton1:SimpleButton;
		var bButton2:SimpleButton;
		
		public function DataShow()
		{
			var g = new com.tecsoo.FaderGain();
			g.x = 50;
			g.y = 200;
			addChild(g);
			/*
			var cbs = new CheckBoxsShow();
			cbs.x = 20;	
			cbs.y = 100;
			addChild(cbs);*/
			var cbs = new ComboBoxShow();
			cbs.x = 20;	
			cbs.y = 100;
			addChild(cbs);
			
			//
			holoShow = new HoloShow();
			addChild(holoShow);
			//
			
			var zoomInButton:SimpleButton = new CircleBubbleGreenZoomIn();
			zoomInButton.x = 50;
			zoomInButton.y = 50;
			zoomInButton.scaleX = 0.5;
			zoomInButton.scaleY = 0.5;
			addChild(zoomInButton);
			var zoomOutButton:SimpleButton = new CircleBubbleGreenZoomOut();
			zoomOutButton.x = 100;
			zoomOutButton.y = 50;
			zoomOutButton.scaleX = 0.5;
			zoomOutButton.scaleY = 0.5;
			addChild(zoomOutButton);
			zoomInButton.addEventListener(MouseEvent.CLICK, holoShow.zoomIn);
			zoomOutButton.addEventListener(MouseEvent.CLICK, holoShow.zoomOut);
			
			
			
			bButton1 = new GelLeftGrey();
			bButton1.x = 200;
			bButton1.y = 50;
			bButton1.addEventListener(MouseEvent.CLICK, holoShow.goBack);
			addChild(bButton1);
			
			
			bButton2 = new GelLeftGreen();
			bButton2.x = 200;
			bButton2.y = 50;
			bButton2.addEventListener(MouseEvent.CLICK, holoShow.goBack);
			addChild(bButton2);
			bButton2.visible = false;
			
			
			
			cbs.addEventListener(HoloEvent.COMBO_CHANGED, holoShow.showTypeChanged);
			g.getGButton().addEventListener(HoloEvent.FADER_MOVED, holoShow.moved);
			
			g.addEventListener(HoloEvent.WEIGHT_CHANGED, g.getGButton().weightChanged);
			
			holoShow.addEventListener(MouseEvent.MOUSE_WHEEL, holoShow.zoomWheel);
			
		}
		public function renew(dataV:URLVariables, showLength:String, recallFunc1:String, recallFunc2:String, showNum:int):void
		{
			
			holoShow.renew(recallFunc1, recallFunc2, showLength, 
									dataV.subName, subCenter, dataV.subURI, 
									dataV.objNamesArray, dataV.objRelationsArray, dataV.objURIsArray, 
									dataV.objWeightsArray, dataV.objTypesArray);
			
			
			if(holoShow.historyIsEmpty())
			{
				bButton1.visible = true;
				bButton2.visible = false;
			}
			else
			{
				bButton1.visible = false;
				bButton2.visible = true;
			}
			holoShow.paint(showNum);
		}
		public function getLastNum():int
		{
			return holoShow.getLastNum();
		}
	}
}