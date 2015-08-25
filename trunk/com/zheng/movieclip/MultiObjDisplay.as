package com.zheng.movieclip
{
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;

	/**
	 * @describe  	一个显示对象有多个状态的时候，使用该类来处理
	 * @author  	Mr.zheng
	 * @website 	http://blog.sina.com.cn/zihua2007
	 * @time		... 
	 */
	public class MultiObjDisplay extends GameSprite
	{
		private var _displayMc:DisplayObjectContainer;
		private var _statusArr:Array;
		private var _currStatus:String;
		
		public function MultiObjDisplay(displayMc:DisplayObjectContainer) 
		{
			_displayMc = displayMc;
			_statusArr = new Array();
			delAllDisplay();
		}
		public function addStatus(statusName:String,displayObj:DisplayObject):void 
		{
			_statusArr[statusName] = displayObj;
		}
		public function gotoStatus(statusName:String):void 
		{
			if (!hasStatus(statusName)) throw new Error("指定的状态不存在。");
			if (statusName == _currStatus) return ;
			if(currDisplay!=null){
				this.removeChild(currDisplay);
			}
			var mc:DisplayObject = getDisplayByName(statusName);
			_currStatus = statusName;
			this.addChild(mc);
			mc.x = mc.y=0;
		}
		//根据statusname确定，是否存在指定的状态
		public function hasStatus(statusName:String):Boolean {
			for (var name:String in _statusArr) 
			{
				if (name == statusName) {
					return true;
				}
			}
			return false;
		}
		//获取statusName对应的displayObject
		public function getDisplayByName(statusName:String):DisplayObject 
		{
			if (_statusArr[statusName] != null) {
				return _statusArr[statusName] as DisplayObject;
			}else {
				return null;
			}
		}
		public function isDisplayShow(displayObj:DisplayObject):Boolean
		{
			var childMc:DisplayObject;
			var num:int=_displayMc.numChildren;
			for (var i:int = 0; i < num; i++) 
			{
				childMc = _displayMc.getChildAt(0);
				if (childMc === displayObj) {
					return true;
				}
			}
			return false;
		}
		public function get displayMc():DisplayObjectContainer { return _displayMc; }
		public function get currStatus():String { return _currStatus; }
		public function get currDisplay():DisplayObject { return getDisplayByName(_currStatus); }
		//private===============================================================
		private function delAllDisplay():void 
		{
			var num:int = _displayMc.numChildren;
			for (var i:int = 0; i < num; i++) 
			{
				_displayMc.removeChildAt(0);
				
			}
		}
	}
	
}