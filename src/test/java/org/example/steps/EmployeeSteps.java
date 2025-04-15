package org.example.steps;

import io.cucumber.datatable.DataTable;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import org.example.models.Employee;
import org.example.utils.DatabaseUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.sql.*;
import java.util.List;
import java.util.Map;

import static org.junit.jupiter.api.Assertions.assertEquals;

public class EmployeeSteps {

    private static final Logger logger = LoggerFactory.getLogger(EmployeeSteps.class);

    private List<Map<String, String>> actualEmployees;

    @When("I query all employees")
    public void iQueryAllEmployees() throws SQLException {
        // Initialize the list to avoid NullPointerException
        actualEmployees = new java.util.ArrayList<>();
        logger.info("Initializing the list for storing employee data.");

        String query = "SELECT id, first_name, last_name, email, phone_number, hire_date, job_id, salary, department_id " +
                "FROM employees WHERE id IN (?, ?, ?, ?, ?)";
        logger.debug("SQL Query: {}", query);

        try (Connection connection = DatabaseUtil.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(query)) {

            // Set parameters
            preparedStatement.setInt(1, 1);
            preparedStatement.setInt(2, 2);
            preparedStatement.setInt(3, 3);
            preparedStatement.setInt(4, 4);
            preparedStatement.setInt(5, 5);
            logger.debug("Query parameters set: [1, 2, 3, 4, 5]");

            // Execute query
            ResultSet resultSet = preparedStatement.executeQuery();
            logger.info("Query executed successfully.");

            // Process the result set
            while (resultSet.next()) {
                Map<String, String> row = Map.of(
                        "id", String.valueOf(resultSet.getInt("id")),
                        "first_name", resultSet.getString("first_name"),
                        "last_name", resultSet.getString("last_name"),
                        "email", resultSet.getString("email"),
                        "phone_number", resultSet.getString("phone_number"),
                        "hire_date", resultSet.getDate("hire_date").toString(),
                        "job_id", String.valueOf(resultSet.getInt("job_id")),
                        "salary", resultSet.getBigDecimal("salary").toString(),
                        "department_id", String.valueOf(resultSet.getInt("department_id"))
                );
                actualEmployees.add(row);
            }
            logger.info("Successfully processed {} employees.", actualEmployees.size());
        } catch (SQLException e) {
            logger.error("Error occurred while querying employees: {}", e.getMessage(), e);
            throw e;
        }
    }

   @Then("I should see the following employees:")
            public void iShouldSeeTheFollowingEmployees(DataTable expectedEmployees) {
                logger.info("Starting validation of expected employees against actual employees.");

                // Convert expected data table to a list of maps
                List<Map<String, String>> expected = expectedEmployees.asMaps(String.class, String.class);
                logger.debug("Expected employees: {}", expected);

                // Assert that the actual data matches the expected data
                assertEquals(expected.size(), actualEmployees.size(), "The number of employees does not match.");
                logger.info("Number of employees matches: {}", expected.size());

                for (int i = 0; i < expected.size(); i++) {
                    Map<String, String> expectedRow = new java.util.HashMap<>(expected.get(i)); // Create a mutable copy
                    Map<String, String> actualRow = new java.util.HashMap<>(actualEmployees.get(i)); // Create a mutable copy

                    // Normalize salary values for comparison
                    if (expectedRow.containsKey("salary")) {
                        expectedRow.put("salary", String.format("%.2f", Double.parseDouble(expectedRow.get("salary"))));
                    }
                    if (actualRow.containsKey("salary")) {
                        actualRow.put("salary", String.format("%.2f", Double.parseDouble(actualRow.get("salary"))));
                    }

                    logger.debug("Comparing row {}: expected={}, actual={}", i + 1, expectedRow, actualRow);

                    // Compare the maps directly
                    assertEquals(expectedRow, actualRow, "Mismatch at row " + (i + 1));
                }

                logger.info("Validation of employees completed successfully.");
            }
}