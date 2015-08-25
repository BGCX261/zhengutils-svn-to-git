package com.zheng.utils
{
	/**
	 *导入的媒体尺寸适应规定的大小 
	 * @author Administrator
	 * 
	 */	
	public class SuitSize
	{
		public function SuitSize()
		{
		}
		/**
		 * 
		 * @param w	显示区域的宽
		 * @param h	显示区域的高
		 * @param sourceW	图像的宽
		 * @param sourceH	图像的高
		 * @return 	返回一个比例
		 * 
		 */		
		public function suitSize (w:int,h:int,sourceW:int,sourceH:int):Number{
			var size:Number=w/h;
			var sourceSize:Number=sourceW/sourceH;
			if(size>sourceSize){//若显示区域的宽高比大于图像的宽高比
				return h/sourceH
			}else if(size<sourceSize){
				return w/sourceW;
			}else{
				return 1;
			}
			//return null;
		}
	}
}