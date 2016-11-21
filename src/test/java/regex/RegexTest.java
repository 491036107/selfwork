package regex;

import java.util.regex.Matcher;
import java.util.regex.Pattern;
/**
 * 
 * Description:1.正则表达式使用
 * 				2.java字符串截取substring的自定义需求代码片段实现:中文1，英文占0.5的算法实现
 * @author zhangyu
 * @date 2016年10月8日
 */
public class RegexTest {

	public RegexTest() {
		// TODO Auto-generated constructor stub
	}
	/**
	 * Description:中文判断
	 * @param str
	 * @return
	 * @author:zhangyu
	 * @date:2016年10月8日
	 */
	public static boolean isChinese(String str) {

	      String regEx = "[\u4e00-\u9fa5]";

	      Pattern pat = Pattern.compile(regEx);

	      Matcher matcher = pat.matcher(str);

	      boolean flg = false;

	      if (matcher.find()){
	    	  flg = true;
	      }
	      return flg;
	}
	/**
	 * Description:java字符串截取substring的自定义需求代码片段实现:中文1，英文占0.5的算法实现
	 * @param value
	 * @param len
	 * @return
	 * @author:zhangyu
	 * @date:2016年10月8日
	 */
	public static String complexSubstring(String value, int len) {
		String ret = "";
		String[] _arr = value.split("");
                //第一个字符是无效的，去掉即可
		_arr[0] = null;
		float size = 0;
		for (String s : _arr) {
			if (s == null) {
				continue;
			}
			if (isChinese(s)) {
				size += 1;
			} else {
				size += 0.5;
			}
			ret += s;
			int _size = Math.round(size);
			if (_size >= len) {
				break;
			}
		}
		return ret;
	}

	public static void main(String[] args) {
			String string = "中1中2中3";
			System.out.println(complexSubstring(string, 2));
			System.out.println(complexSubstring(string, 3));
			System.out.println(complexSubstring(string, 5));
		}
}
