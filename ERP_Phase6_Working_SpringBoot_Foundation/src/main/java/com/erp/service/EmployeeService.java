
package com.erp.service;
import com.erp.entity.Employee;
import com.erp.repository.EmployeeRepository;
import java.util.List;
public class EmployeeService {
 private final EmployeeRepository repo;
 public EmployeeService(EmployeeRepository repo){this.repo=repo;}
 public List<Employee> getAll(){ return repo.findAll(); }
}
