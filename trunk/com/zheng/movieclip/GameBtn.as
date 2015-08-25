package com.zheng.movieclip
{	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.geom.Rectangle;
	
	/**
	 * @describe  	游戏中的按钮
	 * @author  	Mr.zheng
	 * @website 	http://blog.sina.com.cn/zihua2007
	 * @time		... 
	 */
	public class GameBtn extends GameSprite
	{
		private var _displayMc:MovieClip;
		private var _scaleNum:Number = 1.05;
		
		public function GameBtn(displayMc:MovieClip) 
		{
			_displayMc = displayMc;
			addChild(_displayMc);
			addEvent();
		}
		override public function delThis():void 
		{
			delEvent();
			clearContain(this);
			_displayMc = null;
		}
		private function addEvent():void {
			_displayMc.addEventListener(MouseEvent.ROLL_OVER,onRollOver);
			_displayMc.addEventListener(MouseEvent.ROLL_OUT,onRollOut);
		}
		private function delEvent():void 
		{
			_displayMc.removeEventListener(MouseEvent.ROLL_OVER, onRollOver);
			_displayMc.removeEventListener(MouseEvent.ROLL_OUT, onRollOut);
		}
		private function onRollOut(e:MouseEvent):void 
		{
			_displayMc.scaleX = 1;
			_displayMc.scaleY = 1;
		}
		private function onRollOver(e:MouseEvent):void 
		{
			_displayMc.scaleX = _scaleNum;
			_displayMc.scaleY = _scaleNum;
		}
	}
	
}