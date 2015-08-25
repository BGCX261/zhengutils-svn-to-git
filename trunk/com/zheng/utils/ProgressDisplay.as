package com.zheng.utils
{
	import flash.display.MovieClip;
	
	/**
	 * ...
	 * @author zhengzihua
	 */
	public class ProgressDisplay extends MovieClip
	{
		private var totalFrame:int;
		private var topMc:MovieClip;
		private var behindMc:MovieClip;
		private var totalNum:int;
		private var topNum:int
		public function ProgressDisplay(perMc:MovieClip) 
		{
			this.totalFrame = perMc.topMc.totalFrames;
			this.topMc = perMc.topMc;
			this.behindMc = perMc.behindMc;
			perMc.topMc.stop();
			addChild(perMc);
		}
		public function displayProgress(topNum:int,totalNum:int):int {
			var frame:int;
			this.totalNum = totalNum;
			this.topNum = topNum;
			var per:int = topNum / totalNum * 100;
			if(per<50){
				frame = Math.ceil(per * totalFrame / 100) + 1;
			}else {
				frame = Math.floor(per * totalFrame / 100) + 1;
			}
			frame > totalNum?frame = totalNum:"";
			topMc.gotoAndStop(frame);
			return frame;
		}	
	}
	
}