package com.zheng.utils
{
	/**
	 * @ 描述			...
	 * @ 作者			郑子华
	 * @ 版本			version 1.0
	 * @ 创建日期		下午03:45:55
	 */
	public class ObjLoop
	{
		private var MAX_POOL:uint;		//第一次创建时对象池的大小
		private var GROWTH_SIZE:uint;	//每次增加对象的数目
		private var _counter:int;		//对象指针
		private var _pool:Array;
		private var _className:Class;
		
		public function ObjLoop(className:Class,maxPoolSize:int=10,growthSize:int=5)
		{
			MAX_POOL = maxPoolSize;
			GROWTH_SIZE = growthSize;
			_counter = maxPoolSize;
			_className = className;
			_pool = [];
			
			var i:uint = MAX_POOL;
			while (--i>-1) 
			{
				createObj(_className);
			}
		}
		public function getObj():* 
		{
			if (_counter > 0) {
				var obj:*=_pool[--_counter];
				_pool.splice(_counter,1);
				return obj;
			}else{
				var i:uint = GROWTH_SIZE;
				_counter = GROWTH_SIZE;
				while (--i>-1) 
				{
					createObj(_className);
				}
				return getObj();
			}
		}
		public function disposeObj(obj:*):void 
		{
			_pool[_counter++] = obj;
		}
		private function createObj(name:Class):void{
			_pool.push(new name);
		}
	}
}