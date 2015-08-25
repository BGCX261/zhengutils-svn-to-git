package com.zheng.utils
{
	import flash.utils.getTimer;
	import com.utils.DebugTrace;
	/**
	 * ...
	 * @author zhengzihua
	 */
	public class ExpenseTime 
	{
		private var st:int;
		private var et:int;
		private var ty:String = "";
		public function ExpenseTime(str:String) 
		{
			this.ty = str;
			startTime();
		}
		private  function startTime():void {
			st = getTimer();
		}
		public function endTime():void {
			if(st!=0){
				et = getTimer();
				DebugTrace.dtrace("code info ExpenseTime.as:"+ty + "耗时:" + (et - st) + "毫秒。");
			}else {
				DebugTrace.dtrace("error code ExpenseTime.as:没有开始时间");
			}
		}
		
	}
	
}