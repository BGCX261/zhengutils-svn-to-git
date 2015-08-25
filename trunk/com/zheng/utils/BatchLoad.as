package com.zheng.utils 
{
	import flash.display.LoaderInfo;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	
	import com.utils.SWFLoader
	import com.event.EventZheng;
	/**
	 * 批量载入文件
	 * @author zhengzihua
	 */
	public class BatchLoad extends EventDispatcher
	{
		private var loadArr:Array;
		private var domain:String;
		private var dispatchStr:String;
		public function BatchLoad(loadArr:Array,domain:String,str:String) 
		{
			this.loadArr = loadArr;
			this.domain = domain;
			this.dispatchStr = str;
			
		}
		/**
		 * 读取素材
		 */
		public function load():String {
			if (loadArr.length == 0) {
				dispatchEvent(new EventZheng(dispatchStr));
				return "所有素材都已经导入";
			}
			var loadUrl:String = loadArr.shift();
			var swfLoader:SWFLoader = new SWFLoader();
			swfLoader.Load(loadUrl,domain);
			swfLoader.addEventListener(Event.COMPLETE, onLoadComplete);
			return "导入完成一个素材";
		}
		
		private function onLoadComplete(e:Event):void 
		{
			var thisLoader:SWFLoader = e.currentTarget as SWFLoader;
			thisLoader.removeEventListener(Event.COMPLETE, onLoadComplete);	
			load();
		}
		
	}
	
}