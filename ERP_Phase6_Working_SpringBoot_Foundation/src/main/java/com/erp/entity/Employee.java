
package com.erp.entity;
import jakarta.persistence.*;
@Entity
@Table(name="employees")
public class Employee {
 @Id @GeneratedValue(strategy=GenerationType.IDENTITY)
 private Long employeeId;
 private String firstName;
 private String lastName;
 private Double salary;
}
