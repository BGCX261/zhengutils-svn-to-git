package com.zheng.movieclip
{
	import flash.display.MovieClip;
	
	/**
	 * @describe  	动画容器
	 * @author  	Mr.zheng
	 * @website 	http://blog.sina.com.cn/zihua2007
	 * @time		... 
	 */
	public class AM_Container extends GameSprite
	{
		private var _displayMc:MovieClip;
		private const FIRST_FRAME:int=1;
		public function AM_Container(displayMc:MovieClip) 
		{
			_displayMc = displayMc;
			_displayMc.x=_displayMc.y=0;
			_displayMc.stop();
			addChild(_displayMc);
		}
	 	public function play():void{
			_displayMc.gotoAndPlay(FIRST_FRAME);
		}
		public function stop():void 
		{
			_displayMc.gotoAndStop(FIRST_FRAME);
		}
		public function get displayMc():MovieClip { return _displayMc; }
		
	}
	
}