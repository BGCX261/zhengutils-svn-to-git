package com.zheng.utils
{
	import flash.display.DisplayObject;
	import flash.filters.ColorMatrixFilter;
	import view.ui.Petals;
	/**
	 * 改变MovieClip的颜色值
	 * 关键是要过渡的自然
	 * 变化的顺序，正常，红，绿，蓝四个阶段
	 * @author zheng sir
	 */
	public class TransformColorFilter
	{
		private var mc:DisplayObject;
		private var totalNum:int;//slider的maxNum
		private var filterArr:Array;//颜色数组
		
		public function TransformColorFilter(mc:DisplayObject,num:int) 
		{
			this.mc = mc;
			this.totalNum = num;
		}
		public function setMatrixFilter(currentNum:int):void {
			var num:int = int(totalNum / 3);
			var gap:Number = int(100 * 1 / num) / 100;//每次变化的跨度
			
			if (mc is Petals) Petals(mc).petalColorNum = currentNum;
			
			if (currentNum < num) {//这个区间，由正常变成红色
				applyFilter(mc, normalToRed(currentNum*gap));
			}else if (currentNum >= num && currentNum < 2 * num) {//这个区间由红色像绿色转变
				applyFilter(mc, redToGreen(currentNum*gap-1));
			}else if (currentNum >= 2 * num && currentNum < totalNum) {//这个区间由绿色像蓝色转变
				applyFilter(mc, greenToBlue(currentNum*gap-2));
			}
		}
		private function normalToRed(num:Number):Array {
			var matrix:Array = new Array();
			matrix = matrix.concat([1, 0, 0, 0, 0]); // red
			matrix = matrix.concat([0, 1-num, 0, 0, 0]); // green
			matrix = matrix.concat([0, 0, 1-num, 0, 0]); // blue
			matrix = matrix.concat([0, 0, 0, 1, 0]); // alpha
			
			return matrix;
		}
		private function redToGreen(num:Number):Array {
			var matrix:Array = new Array();
			matrix = matrix.concat([1-num, 0, 0, 0, 0]); // red
			matrix = matrix.concat([0, num, 0, 0, 0]); // green
			matrix = matrix.concat([0, 0, 0, 0, 0]); // blue
			matrix = matrix.concat([0, 0, 0, 1, 0]); // alpha
			
			return matrix;
		}
		private function greenToBlue(num:Number):Array {
			var matrix:Array = new Array();
			matrix = matrix.concat([0, 0, 0, 0, 0]); // red
			matrix = matrix.concat([0, 1-num, 0, 0, 0]); // green
			matrix = matrix.concat([0, 0, num, 0, 0]); // blue
			matrix = matrix.concat([0, 0, 0, 1, 0]); // alpha
			
			return matrix;
		}
		private function applyFilter(child:DisplayObject, matrix:Array):void {
            var filter:ColorMatrixFilter = new ColorMatrixFilter(matrix);
            var filters:Array = new Array();
            filters.push(filter);
            child.filters = filters;
        }
		
	}

}