package regex;

import java.util.regex.Matcher;
import java.util.regex.Pattern;
/**
 * 
 * Description:1.������ʽʹ��
 * 				2.java�ַ�����ȡsubstring���Զ����������Ƭ��ʵ��:����1��Ӣ��ռ0.5���㷨ʵ��
 * @author zhangyu
 * @date 2016��10��8��
 */
public class RegexTest {

	public RegexTest() {
		// TODO Auto-generated constructor stub
	}
	/**
	 * Description:�����ж�
	 * @param str
	 * @return
	 * @author:zhangyu
	 * @date:2016��10��8��
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
	 * Description:java�ַ�����ȡsubstring���Զ����������Ƭ��ʵ��:����1��Ӣ��ռ0.5���㷨ʵ��
	 * @param value
	 * @param len
	 * @return
	 * @author:zhangyu
	 * @date:2016��10��8��
	 */
	public static String complexSubstring(String value, int len) {
		String ret = "";
		String[] _arr = value.split("");
                //��һ���ַ�����Ч�ģ�ȥ������
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
			String string = "��1��2��3";
			System.out.println(complexSubstring(string, 2));
			System.out.println(complexSubstring(string, 3));
			System.out.println(complexSubstring(string, 5));
		}
}
