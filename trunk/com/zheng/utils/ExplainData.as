package com.zheng.utils
{
	import com.adobe.utils.StringUtil;
	
	/**
	 * ...
	 * @author zhengzihua
	 */
	public class ExplainData 
	{
		
		public function ExplainData() 
		{
			
		}
		public static  function explainData(str:String ):Object {
			var cmds:Object = {};
			var strArr:Array = [];
			var arrLength:int = 0;
			strArr = str.split("&");
			arrLength = strArr.length;
			for (var i:int = 0; i < arrLength; i++) {
				strArr[i] = StringUtil.trim(strArr[i]);
				strArr[i] = strArr[i].split("=");
				cmds[strArr[i][0]] = strArr[i][1];//不能用cmds.strArr[i][0]表示？
			}
			return cmds;
		}
		
	}
	
}