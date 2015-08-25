package com.zheng.utils
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.DisplayObject;
	/**
	 * 将显示对象装换为bitmap对象
	 * 能够有效的解决文字旋转的问题
	 * @author zhengzihua
	 */
	public class TransformBitmap
	{
		
		public function TransformBitmap() 
		{
			
		}
		/**
		 * 这里没有设置对象显示，也没有设置对象的坐标
		 * @param	mc 显示对象
		 * @return	显示对象装换成Bitmap
		 */
		public function transformBitmap(mc:DisplayObject):Bitmap {
			var bitmapData:BitmapData = new BitmapData(mc.width, mc.height, true, 0xffffff);
			var bitmap:Bitmap = new Bitmap(bitmapData);
			bitmapData.draw(mc);
			bitmap.smoothing = true;
			return bitmap;
		}
		
	}

}