package com.zheng.event 
{
	import flash.events.Event;
	
	/**
	 * 带数据的事件
	 * @author zhengzihua
	 */
	public class EventZheng extends Event
	{
		
		private var _obj:Object;
		public function EventZheng(str:String)
		{
			super(str);
			_obj = { };
		}	
		
		public function get obj():Object { return _obj; }
		
		public function set obj(value:Object):void 
		{
			_obj = value;
		}
		
	}
	
}