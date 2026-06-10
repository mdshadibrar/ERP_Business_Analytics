
package com.erp.controller;
import org.springframework.web.bind.annotation.*;
@RestController
@RequestMapping("/api/employees")
public class EmployeeController {
 @GetMapping
 public String getAll(){ return "Employees API"; }
}
