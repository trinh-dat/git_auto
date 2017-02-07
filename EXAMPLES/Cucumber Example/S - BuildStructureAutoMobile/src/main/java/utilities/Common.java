package utilities;

public class Common {
	
	/**
	 * Sleep for certain milliseconds
	 */

	public static void sleep(int i) {
		try {
			Thread.sleep(i);
		} catch (Exception e) {
			// TODO: handle exception
		}

	}

}
