import unittest
import requests
import logging

class TestAtgWorldWebsite(unittest.TestCase):

    def setUp(self):
        # Settin up logging configuration
        logging.basicConfig(level=logging.INFO)
        self.logger = logging.getLogger(__name__)

    def test_website_loading(self):
        # Setting this variable to True to simulate a failure in connecting to the website
        simulate_failure = True

        url = "https://atg.world"
        error_url = "https://atg.worlp"

        try:
            # Step 1: Logging that the test is starting
            self.logger.info("Step 1: Test - Connecting to atg.world")

            # Step 2: Making a request to the website
            self.logger.info("Step 2: Sending HTTP GET request to %s", url)

            # Simulating failure if simulate_failure is True
            if simulate_failure:
                response = requests.get(error_url)
            else:
                response = requests.get(url)

            # Step 3: Checking if the website loads properly
            self.logger.info("Step 3: Checking response status code")
            self.assertEqual(response.status_code, 200)

            # Step 4: Logging that the test passed
            self.logger.info("Step 4: Test Passed - Website loaded successfully!")

        except requests.ConnectionError:
            # Step 5: Logging that the website didn't load and fail the test
            self.logger.error("Step 5: Test Failed - Unable to connect to the website")
            self.fail("Test Failed - Unable to connect to the website")

if __name__ == '__main__':
    unittest.main()
