package utilities;

import org.testng.IRetryAnalyzer;
import org.testng.ITestNGMethod;
import org.testng.ITestResult;
import org.testng.Reporter;
import org.testng.TestListenerAdapter;

/**
 * Class that determines what to do for test that Pass, Fail or are skipped
 */

public class TestListener extends TestListenerAdapter {

	private int sCount = 1;

	@Override
	public void onTestFailure(ITestResult tr) {
		// TODO Auto-generated method stub
		super.onTestFailure(tr);
		Reporter.setCurrentTestResult(tr);
		final ITestNGMethod method = tr.getMethod();
		final IRetryAnalyzer retryAnalyzer = method.getRetryAnalyzer();
		if (null != retryAnalyzer && retryAnalyzer.retry(tr)) {
			// sCount++;
			tr.setStatus(ITestResult.SKIP);
		} else {
			// sCount = 0;
		}
		log("FAILED", tr);
		Reporter.setCurrentTestResult(null);
		ExcelUtils.setCellValue("Failed", sCount - 1, 6);
	}

	@Override
	public void onTestSkipped(ITestResult tr) {
		// TODO Auto-generated method stub
		super.onTestSkipped(tr);
		log("SKIPPED", tr);
		Reporter.setCurrentTestResult(tr);
		ExcelUtils.setCellValue("Failed", sCount - 1, 6);
	}

	@Override
	public void onTestSuccess(ITestResult tr) {
		// TODO Auto-generated method stub
		super.onTestSuccess(tr);
		log("PASSED", tr);
		Reporter.setCurrentTestResult(tr);
		ExcelUtils.setCellValue("Failed", sCount - 1, 6);
	}

	private void log(final String testStatus, ITestResult tr) {
		// TODO Auto-generated method stub
		String log = String.format("Test Script #%d | %s - %s\n", sCount++, tr.getMethod().getMethodName(), testStatus);
		System.out.println(log);
	}

}
