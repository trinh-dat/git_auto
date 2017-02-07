from selenium.webdriver import ActionChains
from appium import webdriver


class Scroll:
	def scrollToElement(xpath_):
		element = driver.find_element_by_xpath(xpath_)
        actions = ActionChains(driver)
        actions.move_to_element(element).perform()