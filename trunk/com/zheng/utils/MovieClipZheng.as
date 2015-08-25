package com.zheng.utils
{
	import flash.display.MovieClip;
	import flash.events.Event;
	
	/**
	 * 封装MovieClip类
	 * 添加了一个isPlaying属性，这样就可以知道元件是否处于play状态
	 * 添加属性 isEndCall,动画播放到最后一帧抛出LAST_FRAM事件
	 * @author Mr.zheng
	 */
	public class MovieClipZheng extends MovieClip
	{
		private var _isPlaying:Boolean;//是否正在play
		private var _isEndCall:Boolean = false;//到最后一帧抛事件
		
		public static const LAST_FRAME:String = "MovieClipZheng_last_frame";//最后一帧
		
		public function MovieClipZheng() 
		{
			isPlaying = true;
		}
		override public function play():void 
		{
			super.play();
			isPlaying = true;
		}
		override public function gotoAndPlay(frame:Object, scene:String = null):void 
		{
			super.gotoAndPlay(frame, scene);
			isPlaying = true;
		}
		override public function stop():void 
		{
			super.stop();
			isPlaying = false;
		}
		override public function gotoAndStop(frame:Object, scene:String = null):void 
		{
			super.gotoAndStop(frame, scene);
			isPlaying = false;
		}
		
		public function get isPlaying():Boolean { return _isPlaying; }
		
		public function set isPlaying(value:Boolean):void 
		{
			_isPlaying = value;
			if (_isPlaying) {
				if (_isEndCall&&!hasEventListener(Event.ENTER_FRAME)) this.addEventListener(Event.ENTER_FRAME, isLastFrame);
			}else {
				if (hasEventListener(Event.ENTER_FRAME))this.removeEventListener(Event.ENTER_FRAME, isLastFrame);
			}
		}
		
		public function get isEndCall():Boolean { return _isEndCall; }
		
		public function set isEndCall(value:Boolean):void 
		{
			_isEndCall = value;
			if (_isEndCall) {
				if(_isPlaying&&!hasEventListener(Event.ENTER_FRAME))this.addEventListener(Event.ENTER_FRAME, isLastFrame);
			}else {
				if(hasEventListener(Event.ENTER_FRAME))this.removeEventListener(Event.ENTER_FRAME, isLastFrame);
			}
			
		}
		
		private function isLastFrame(e:Event):void 
		{
			if(currentFrame==totalFrames){
				dispatchEvent(new Event(LAST_FRAME))
			}
		}
		
	}

}