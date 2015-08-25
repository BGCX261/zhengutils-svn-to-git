package com.zheng.movieclip
{
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	
	/**
	 * @describe  	继承Sprite，作为一个中间类存在
	 * @author  	Mr.zheng
	 * @website 	http://blog.sina.com.cn/zihua2007
	 * @time		... 
	 */
	public class GameSprite extends Sprite
	{
		//删除自己，子类覆写
		public function delThis():void { }
		//清理显示对象
		public function clearContain(contain:DisplayObjectContainer):void {
			for (var name:String in contain) 
			{
				var displayMc:DisplayObject = contain[name] as DisplayObject ;
				if (displayMc is DisplayObjectContainer) {
					if(displayMc is MovieClip){
						MovieClip(displayMc).gotoAndStop(1);
					}
					clearContain(displayMc as DisplayObjectContainer);
				}
				contain.removeChild(displayMc);
			}
		}
		
	}
	
}