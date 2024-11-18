abstract class Employee {
  String name;
  String id;

  Employee(this.name, this.id);

  void printInfo() {
    print("Name: $name , ID: $id");
  }

  double calculateSalary();
}

abstract class Workable {
  void doWork();
}

class OfficeWorker extends Employee implements Workable {
  String department;

  OfficeWorker(String name, String id, this.department) : super(name, id);

  @override
  double calculateSalary() {
    return 5000.0;
  }

  @override
  void doWork() {
    print('Working in $department department');
  }
}

class TechWorker extends Employee implements Workable {
  String field;

  TechWorker(String name, String id, this.field) : super(name, id);

  @override
  double calculateSalary() {
    return 10000.0;
  }

  @override
  void doWork() {
    print('Working in $field field');
  }
}

class Company {
  List<Employee> employees = [];

  void addEmployee(Employee employee) {
    employees.add(employee);

    print("Added employee: ${employee.name}");
  }

  void printEmployee() {
    for (var employee in employees) {
      employee.printInfo();
    }
  }

  double getToTalSalary() {
    double total = 0.0;

    for (var employee in employees) {
      total += employee.calculateSalary();
    }

    return total;
  }
}

void main() {
  var company = Company();

  var officeWorker = OfficeWorker('Thông', "1516", "Student");
  var techWorker = TechWorker('A.Hiếu', "1517", "IT");

  company.addEmployee(officeWorker);
  company.addEmployee(techWorker);

  company.printEmployee();

  var result = company.getToTalSalary();
  print('Total salary: ${result}');
  
}
