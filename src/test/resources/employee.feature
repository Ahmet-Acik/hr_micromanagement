Feature: Employee Management

  Scenario: Verify employees in the database
    When I query all employees
    Then I should see the following employees:
      | id | first_name | last_name | email                     | phone_number | hire_date  | job_id | salary  | department_id |
      | 1  | Alice      | Johnson   | alice.johnson@example.com | 123-456-7890 | 2022-01-15 | 1      | 96000.0 | 1             |
      | 2  | Bob        | Smith     | bob.smith@example.com     | 123-456-7891 | 2021-03-10 | 1      | 90000.0 | 1             |
      | 3  | Charlie    | Brown     | charlie.brown@example.com | 123-456-7892 | 2020-07-20 | 1      | 85000.0 | 1             |
      | 4  | Diana      | White     | diana.white@example.com   | 123-456-7893 | 2022-05-25 | 2      | 80000.0 | 2             |
      | 5  | Eve        | Black     | eve.black@example.com     | 123-456-7894 | 2021-11-30 | 2      | 78000.0 | 2             |
