package org.example;

import org.example.models.Department;
import org.example.models.DepartmentDAO;

import java.sql.SQLException;
import java.util.List;

public class Main {
    public static void main(String[] args) {

//        Department department = new Department();
//        department.setId(1);
//        department.setName("HR");
//        department.setLocation("New York");
//        System.out.println("Department ID: " + department.getId());
//        System.out.println("Department Name: " + department.getName());
//        System.out.println("Department Location: " + department.getLocation());
//
//        Job job = new Job();
//        job.setId(101);
//        job.setTitle("Software Engineer");
//        job.setMinSalary(60000);
//        job.setMaxSalary(120000);
//        System.out.println("Job ID: " + job.getId());
//        System.out.println("Job Title: " + job.getTitle());
//        System.out.println("Job Min Salary: " + job.getMinSalary());
//        System.out.println("Job Max Salary: " + job.getMaxSalary());
//
//        Project project = new Project();
//        project.setId(1001);
//        project.setName("Project Alpha");
//        project.setStartDate(new Date(System.currentTimeMillis()));
//        project.setEndDate(new Date(System.currentTimeMillis() + 86400000L)); // 1 day later
//        project.setBudget(500000);
//        System.out.println("Project ID: " + project.getId());
//        System.out.println("Project Name: " + project.getName());
//        System.out.println("Project Start Date: " + project.getStartDate());
//        System.out.println("Project End Date: " + project.getEndDate());
//        System.out.println("Project Budget: " + project.getBudget());


        DepartmentDAO departmentDAO = new DepartmentDAO();

        try {
            // Create a new department
            departmentDAO.createDepartment("HR", "New York");
            System.out.println("Department created successfully!");

            // Read all departments
            List<Department> departments = departmentDAO.getAllDepartments();
            departments.forEach(department ->
                    System.out.println("ID: " + department.getId() + ", Name: " + department.getName() + ", Location: " + department.getLocation())
            );

            // Update a department
            if (!departments.isEmpty()) {
                Department departmentToUpdate = departments.getFirst();
                departmentDAO.updateDepartment(departmentToUpdate.getId(), "Human Resources", "Los Angeles");
                System.out.println("Department updated successfully!");
            }

            // Delete a department
            if (!departments.isEmpty()) {
                Department departmentToDelete = departments.getFirst();
                departmentDAO.deleteDepartment(departmentToDelete.getId());
                System.out.println("Department deleted successfully!");
            }

        } catch (SQLException e) {
            System.err.println("Database operation failed: " + e.getMessage());
        }

    }
}