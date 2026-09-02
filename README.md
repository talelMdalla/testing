# DAXme TEST WEB

## Installation

1. Download and Install [Python](https://www.python.org/downloads/ "Python").
2. Check Python installation

   `python3 -V`

3. Install [pip](https://pip.pypa.io/ "pip").

   `pip3 -V`

4. Install Robot Framework.

   `pip3 install -r requirements.txt`

## Example

Here, I have developed sample test cases for a sample web site [Demoblaze](https://demoblaze.com/).

This project is developed to demontrate Web UI automation using Robot Framework and Selenium Library.

Here, there are 3 variables `${SMALL_RETRY_SCALE}`, `${MEDIUM_RETRY_SCALE}` and `${LARGE_RETRY_SCALE}` for retrying the keywords when they are failing. Each variable has assigned with the number of retries. Automation engineers are advised to use `${SMALL_RETRY_SCALE}` as the default number of retries for the keywords. If there are big delays in some scenarios, you can use other variables `${MEDIUM_RETRY_SCALE}` and `${LARGE_RETRY_SCALE}`. You can find the examples for this in `object-repository/page-objects` directory.

Test cases are in `test-cases` directory and covers login functionality.

## Usage

Starting from Robot Framework 3.0, tests are executed from the command line
using the `robot` script or by executing the `robot` module directly
like `python -m robot` or `jython -m robot`.

The basic usage is giving a path to a test (or task) file or directory as an
argument with possible command line options before the path

    robot -v ENV:LOCAL -i smoke -d results ./tests
    robot -v ENV:LOCAL -i smoke -d results ./tests/auth/Login.robot

"**_-v_**" refers to the variables. To replace a declared value within the code, you can specify a variable name and value.

"**_-i_**" refers to the tags. To run only a selected group of tests, you may specify a tag name.

"**_-d_**" refers to the test results. The location to save the test results can be specified here.

Additionally there is `rebot` tool for combining results and otherwise
post-processing outputs

    rebot --name Example output1.xml output2.xml

Run `robot --help` and `rebot --help` for more information about the command
line usage. For a complete reference manual see [Robot Framework User Guide](https://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html "Robot Framework User Guide").
"# testing" 
