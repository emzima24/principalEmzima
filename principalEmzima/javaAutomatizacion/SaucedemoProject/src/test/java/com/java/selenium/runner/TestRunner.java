package com.java.selenium.runner;

import org.junit.platform.suite.api.ConfigurationParameter;
import org.junit.platform.suite.api.IncludeEngines;
import org.junit.platform.suite.api.SelectClasspathResource;
import org.junit.platform.suite.api.Suite;
import static io.cucumber.junit.platform.engine.Constants.GLUE_PROPERTY_NAME;

@Suite
@IncludeEngines("cucumber")
@SelectClasspathResource("com/java/selenium/features")
@ConfigurationParameter(key = GLUE_PROPERTY_NAME, value = "com.java.selenium.steps")
public class TestRunner {
}
