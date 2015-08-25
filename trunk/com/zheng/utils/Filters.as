package com.zheng.utils
{
	import flash.filters.ColorMatrixFilter;
	import flash.filters.GlowFilter;
	
	public class Filters {
		public function Filters():void {
			
		}
		public function banding(color:int,alpha:int):Array {
			var blur_X:int=5;
			var blur_Y:int=5;
			var s:int=2;
			var q:int=2;
			var ig:Boolean=false;
			var k:Boolean=false;

			var filter:GlowFilter = new GlowFilter(color,alpha,blur_X,blur_Y,s,q,ig,k);
			var filters:Array = new Array();
			filters.push(filter);
			return filters;
		}
		public function changeDark():Array {
			var matrix:Array = new Array();
			matrix = matrix.concat([0, 0, 0, 0, 0]);
			matrix = matrix.concat([0, 0, 0, 0, 0]);
			matrix = matrix.concat([0, 0, 0, 0, 0]);
			matrix = matrix.concat([0, 0, 0, 1, 0]);
			var filter:ColorMatrixFilter = new ColorMatrixFilter(matrix);
			var filters:Array = new Array();
			filters.push(filter);
			return filters;
		}
		public function changeLigh():Array {
			var matrix:Array = new Array();
			matrix = matrix.concat([1, 0, 0, 0.1, 0]);
			matrix = matrix.concat([0, 1, 0, 0.1, 0]);
			matrix = matrix.concat([0, 0, 1, 0.1, 0]);
			matrix = matrix.concat([0, 0, 0, 1, 0]);
			var filter:ColorMatrixFilter = new ColorMatrixFilter(matrix);
			var filters:Array = new Array();
			filters.push(filter);
			return filters;
		}
		
	}
	
}