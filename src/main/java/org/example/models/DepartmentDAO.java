// src/main/java/org/example/DepartmentDAO.java
package org.example.models;

import org.example.utils.DatabaseUtil;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class DepartmentDAO {

    // Create a new department
    public void createDepartment(String name, String location) throws SQLException {
        String sql = "INSERT INTO departments (name, location) VALUES (?, ?)";
        try (Connection connection = DatabaseUtil.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, name);
            statement.setString(2, location);
            statement.executeUpdate();
        }
    }

    // Read all departments
    public List<Department> getAllDepartments() throws SQLException {
        List<Department> departments = new ArrayList<>();
        String sql = "SELECT * FROM departments";
        try (Connection connection = DatabaseUtil.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql);
             ResultSet resultSet = statement.executeQuery()) {
            while (resultSet.next()) {
                Department department = new Department();
                department.setId(resultSet.getInt("id"));
                department.setName(resultSet.getString("name"));
                department.setLocation(resultSet.getString("location"));
                departments.add(department);
            }
        }
        return departments;
    }

    // Update a department
    public void updateDepartment(int id, String name, String location) throws SQLException {
        String sql = "UPDATE departments SET name = ?, location = ? WHERE id = ?";
        try (Connection connection = DatabaseUtil.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, name);
            statement.setString(2, location);
            statement.setInt(3, id);
            statement.executeUpdate();
        }
    }

    // Delete a department
    public void deleteDepartment(int id) throws SQLException {
        String sql = "DELETE FROM departments WHERE id = ?";
        try (Connection connection = DatabaseUtil.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, id);
            statement.executeUpdate();
        }
    }


}