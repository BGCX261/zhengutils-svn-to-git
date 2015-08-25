package com.zheng.utils
{
	import flash.system.ApplicationDomain;
	import flash.utils.*;
	
	public class GetMovieClip
	{
		public static function getMovieClip(className:String):*
		{
			if(hasItem(className)){
				var mc:* = Class(getDefinitionByName(className));
				return new mc  ;
			}else {
				throw new Error("code error GetMovieClip.as:没有指定的类");
			}
		}
		public static function hasItem(className:String):Boolean{
			return ApplicationDomain.currentDomain.hasDefinition(className);
		}
	}	
}