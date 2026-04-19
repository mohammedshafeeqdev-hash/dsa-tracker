# Complete DSA Tracker Application Guide
## Build Your Own Spring Boot REST API from Scratch

This guide contains the complete step-by-step process to create a DSA (Data Structures and Algorithms) Tracker application using Spring Boot. Follow each step carefully.

---

## Prerequisites Setup

### 1. Install Java 17
- Download from: https://adoptium.net/
- Install and set JAVA_HOME environment variable
- Verify: Open command prompt and run `java -version`

### 2. Install Maven
- Download from: https://maven.apache.org/download.cgi
- Extract to a folder (e.g., C:\apache-maven-3.9.9)
- Add to PATH: `C:\apache-maven-3.9.9\bin`
- Verify: Run `mvn -version` in command prompt

### 3. Install VS Code
- Download from: https://code.visualstudio.com/
- Install extensions:
  - Java Extension Pack
  - Spring Boot Extension Pack

---

## Project Structure Creation

Create the following folder structure:

```
MyDSA-Tracker/
├── src/
│   └── main/
│       ├── java/
│       │   └── com/
│       │       └── dsatracker/
│       │           ├── DsaTrackerApplication.java
│       │           ├── controller/
│       │           │   └── ProblemController.java
│       │           ├── service/
│       │           │   └── ProblemService.java
│       │           ├── repository/
│       │           │   └── ProblemRepository.java
│       │           └── entity/
│       │               ├── Problem.java
│       │               ├── Difficulty.java
│       │               └── Status.java
│       └── resources/
│           └── application.properties
├── pom.xml
└── README.md
```

---

## Step 1: Create pom.xml

Create a file named `pom.xml` in the root folder with this exact content:

```xml
<?xml version="1.0" encoding="UTF-8"?>
<project xmlns="http://maven.apache.org/POM/4.0.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
         xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 https://maven.apache.org/xsd/maven-4.0.0.xsd">
    <modelVersion>4.0.0</modelVersion>
    <parent>
        <groupId>org.springframework.boot</groupId>
        <artifactId>spring-boot-starter-parent</artifactId>
        <version>3.2.0</version>
        <relativePath/>
    </parent>
    <groupId>com.dsatracker</groupId>
    <artifactId>dsa-tracker</artifactId>
    <version>0.0.1-SNAPSHOT</version>
    <name>dsa-tracker</name>
    <description>My Personal DSA Tracker</description>
    <properties>
        <java.version>17</java.version>
    </properties>
    <dependencies>
        <dependency>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-starter-web</artifactId>
        </dependency>
        <dependency>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-starter-data-jpa</artifactId>
        </dependency>
        <dependency>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-starter-validation</artifactId>
        </dependency>
        <dependency>
            <groupId>com.h2database</groupId>
            <artifactId>h2</artifactId>
            <scope>runtime</scope>
        </dependency>
        <dependency>
            <groupId>org.projectlombok</groupId>
            <artifactId>lombok</artifactId>
            <optional>true</optional>
        </dependency>
        <dependency>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-starter-test</artifactId>
            <scope>test</scope>
        </dependency>
    </dependencies>

    <build>
        <plugins>
            <plugin>
                <groupId>org.springframework.boot</groupId>
                <artifactId>spring-boot-maven-plugin</artifactId>
                <configuration>
                    <excludes>
                        <exclude>
                            <groupId>org.projectlombok</groupId>
                            <artifactId>lombok</artifactId>
                        </exclude>
                    </excludes>
                </configuration>
            </plugin>
        </plugins>
    </build>

</project>
```

**What this does:**
- Defines the project as a Spring Boot application
- Specifies Java 17 as the version
- Includes all necessary dependencies for web, database, and validation
- Configures Maven build process

---

## Step 2: Create Main Application Class

Create `DsaTrackerApplication.java` in `src/main/java/com/dsatracker/`:

```java
package com.dsatracker;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class DsaTrackerApplication {

    public static void main(String[] args) {
        SpringApplication.run(DsaTrackerApplication.class, args);
    }

}
```

**What this does:**
- `@SpringBootApplication` enables auto-configuration
- `main()` method starts the Spring Boot application
- Spring Boot automatically scans for components in this package and subpackages

---

## Step 3: Create Entity Classes

### Create Difficulty.java in src/main/java/com/dsatracker/entity/:

```java
package com.dsatracker.entity;

public enum Difficulty {
    EASY,
    MEDIUM,
    HARD
}
```

### Create Status.java in src/main/java/com/dsatracker/entity/:

```java
package com.dsatracker.entity;

public enum Status {
    NOT_SOLVED,
    SOLVED,
    REVISION
}
```

### Create Problem.java in src/main/java/com/dsatracker/entity/:

```java
package com.dsatracker.entity;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import lombok.Data;

@Entity
@Data
@Table(name = "problems")
public class Problem {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @NotBlank(message = "Title is required")
    private String title;

    @NotBlank(message = "Topic is required")
    private String topic;

    @NotNull(message = "Difficulty is required")
    @Enumerated(EnumType.STRING)
    private Difficulty difficulty;

    private String description;

    private String link;

    @NotNull(message = "Status is required")
    @Enumerated(EnumType.STRING)
    private Status status;

    @Column(columnDefinition = "TEXT")
    private String code;

    @Column(columnDefinition = "TEXT")
    private String notes;

    @Column(columnDefinition = "TEXT")
    private String mistakes;
}
```

**What these do:**
- `Difficulty` and `Status` are enums for fixed values
- `Problem` is the main entity class
- `@Entity` marks it as a JPA entity (database table)
- `@Data` (from Lombok) generates getters, setters, toString, equals, hashCode
- `@Table` specifies the table name
- `@Id` marks the primary key
- `@GeneratedValue` makes ID auto-increment
- `@NotBlank` and `@NotNull` add validation
- `@Enumerated` stores enums as strings in database
- `@Column` with TEXT allows large text content

---

## Step 4: Create Repository Layer

Create `ProblemRepository.java` in `src/main/java/com/dsatracker/repository/`:

```java
package com.dsatracker.repository;

import com.dsatracker.entity.Problem;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ProblemRepository extends JpaRepository<Problem, Long> {
}
```

**What this does:**
- `@Repository` marks this as a Spring component
- `JpaRepository<Problem, Long>` provides CRUD operations automatically:
  - `save()` - Create/Update
  - `findById()` - Read by ID
  - `findAll()` - Read all
  - `deleteById()` - Delete
  - `existsById()` - Check if exists

---

## Step 5: Create Service Layer

Create `ProblemService.java` in `src/main/java/com/dsatracker/service/`:

```java
package com.dsatracker.service;

import com.dsatracker.entity.Problem;
import com.dsatracker.entity.Status;
import com.dsatracker.repository.ProblemRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class ProblemService {

    @Autowired
    private ProblemRepository problemRepository;

    public List<Problem> getAllProblems() {
        return problemRepository.findAll();
    }

    public Optional<Problem> getProblemById(Long id) {
        return problemRepository.findById(id);
    }

    public Problem createProblem(Problem problem) {
        return problemRepository.save(problem);
    }

    public Problem updateProblem(Long id, Problem problemDetails) {
        Optional<Problem> optionalProblem = problemRepository.findById(id);
        if (optionalProblem.isPresent()) {
            Problem problem = optionalProblem.get();
            problem.setTitle(problemDetails.getTitle());
            problem.setTopic(problemDetails.getTopic());
            problem.setDifficulty(problemDetails.getDifficulty());
            problem.setDescription(problemDetails.getDescription());
            problem.setLink(problemDetails.getLink());
            problem.setStatus(problemDetails.getStatus());
            problem.setCode(problemDetails.getCode());
            problem.setNotes(problemDetails.getNotes());
            problem.setMistakes(problemDetails.getMistakes());
            return problemRepository.save(problem);
        }
        return null;
    }

    public boolean deleteProblem(Long id) {
        if (problemRepository.existsById(id)) {
            problemRepository.deleteById(id);
            return true;
        }
        return false;
    }

    public Problem updateStatus(Long id, Status status) {
        Optional<Problem> optionalProblem = problemRepository.findById(id);
        if (optionalProblem.isPresent()) {
            Problem problem = optionalProblem.get();
            problem.setStatus(status);
            return problemRepository.save(problem);
        }
        return null;
    }
}
```

**What this does:**
- `@Service` marks this as a business logic component
- `@Autowired` injects the repository dependency
- Contains all business logic methods
- Handles data transformation and validation logic
- Returns appropriate data types for the controller

---

## Step 6: Create Controller Layer

Create `ProblemController.java` in `src/main/java/com/dsatracker/controller/`:

```java
package com.dsatracker.controller;

import com.dsatracker.entity.Problem;
import com.dsatracker.entity.Status;
import com.dsatracker.service.ProblemService;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/problems")
public class ProblemController {

    @Autowired
    private ProblemService problemService;

    @GetMapping
    public List<Problem> getAllProblems() {
        return problemService.getAllProblems();
    }

    @GetMapping("/{id}")
    public ResponseEntity<Problem> getProblemById(@PathVariable Long id) {
        Optional<Problem> problem = problemService.getProblemById(id);
        return problem.map(value -> new ResponseEntity<>(value, HttpStatus.OK))
                      .orElseGet(() -> new ResponseEntity<>(HttpStatus.NOT_FOUND));
    }

    @PostMapping
    public ResponseEntity<Problem> createProblem(@Valid @RequestBody Problem problem) {
        Problem createdProblem = problemService.createProblem(problem);
        return new ResponseEntity<>(createdProblem, HttpStatus.CREATED);
    }

    @PutMapping("/{id}")
    public ResponseEntity<Problem> updateProblem(@PathVariable Long id, @Valid @RequestBody Problem problemDetails) {
        Problem updatedProblem = problemService.updateProblem(id, problemDetails);
        if (updatedProblem != null) {
            return new ResponseEntity<>(updatedProblem, HttpStatus.OK);
        }
        return new ResponseEntity<>(HttpStatus.NOT_FOUND);
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteProblem(@PathVariable Long id) {
        boolean deleted = problemService.deleteProblem(id);
        if (deleted) {
            return new ResponseEntity<>(HttpStatus.NO_CONTENT);
        }
        return new ResponseEntity<>(HttpStatus.NOT_FOUND);
    }

    @PutMapping("/{id}/status")
    public ResponseEntity<Problem> updateStatus(@PathVariable Long id, @RequestBody Status status) {
        Problem updatedProblem = problemService.updateStatus(id, status);
        if (updatedProblem != null) {
            return new ResponseEntity<>(updatedProblem, HttpStatus.OK);
        }
        return new ResponseEntity<>(HttpStatus.NOT_FOUND);
    }
}
```

**What this does:**
- `@RestController` marks this as a REST API controller
- `@RequestMapping("/problems")` makes all endpoints start with /problems
- Each method handles a different HTTP request:
  - `@GetMapping` for GET requests
  - `@PostMapping` for POST requests
  - `@PutMapping` for PUT requests
  - `@DeleteMapping` for DELETE requests
- `@PathVariable` extracts ID from URL
- `@RequestBody` converts JSON to Java objects
- `@Valid` triggers validation
- `ResponseEntity` allows custom HTTP status codes

---

## Step 7: Create Configuration

Create `application.properties` in `src/main/resources/`:

```properties
# H2 Database Configuration
spring.datasource.url=jdbc:h2:mem:dsatracker
spring.datasource.driverClassName=org.h2.Driver
spring.datasource.username=sa
spring.datasource.password=password

# JPA/Hibernate Configuration
spring.jpa.database-platform=org.hibernate.dialect.H2Dialect
spring.jpa.hibernate.ddl-auto=update
spring.jpa.show-sql=true

# H2 Console (for development)
spring.h2.console.enabled=true

# Server Configuration
server.port=8080
```

**What this does:**
- Configures H2 in-memory database
- Sets JPA to auto-create/update tables
- Enables H2 web console for database inspection
- Sets server to run on port 8080

---

## Step 8: Build and Run the Application

### Open Command Prompt/Terminal
Navigate to your project folder: `cd C:\Users\sumay\MyDSA-Tracker`

### Download Dependencies
Run: `mvn clean install`

### Run the Application
Run: `mvn spring-boot:run`

**Expected Output:**
```
  .   ____          _            __ _ _
 /\\ / ___'_ __ _ _(_)_ __  __ _ \ \ \ \
( ( )\___ | '_ | '_| | '_ \/ _` | \ \ \ \
 \\/  ___)| |_)| | | | | || (_| |  ) ) ) )
  '  |____| .__|_| |_|_| |_\__, | / / / /
 =========|_|==============|___/=/_/_/_/
 :: Spring Boot ::                (v3.2.0)

2026-04-20T12:00:00.000+05:30  INFO 12345 --- [           main] com.dsatracker.DsaTrackerApplication     : Started DsaTrackerApplication in 3.5 seconds
```

---

## Step 9: Test the Application

### 1. Check if Server is Running
Open browser: `http://localhost:8080/problems`
Should return: `[]` (empty array)

### 2. Access H2 Console
- URL: `http://localhost:8080/h2-console`
- JDBC URL: `jdbc:h2:mem:dsatracker`
- Username: `sa`
- Password: `password`
- Click "Connect"

### 3. Test API Endpoints

**Create a Problem (POST):**
```bash
curl -X POST http://localhost:8080/problems \
  -H "Content-Type: application/json" \
  -d '{
    "title": "Two Sum",
    "topic": "Array",
    "difficulty": "EASY",
    "status": "NOT_SOLVED"
  }'
```

**Get All Problems (GET):**
```bash
curl http://localhost:8080/problems
```

**Update Status (PUT):**
```bash
curl -X PUT http://localhost:8080/problems/1/status \
  -H "Content-Type: application/json" \
  -d '{"status": "SOLVED"}'
```

---

## Understanding the Flow

### Request Flow:
1. **Client** sends HTTP request to `/problems`
2. **Controller** receives request and calls service
3. **Service** contains business logic and calls repository
4. **Repository** interacts with database via JPA
5. **Database** stores/retrieves data
6. Response flows back: Repository → Service → Controller → Client

### Key Concepts:
- **Spring Boot**: Auto-configuration framework
- **REST**: Architectural style for web services
- **JPA**: Java Persistence API for database operations
- **H2**: Lightweight in-memory database
- **Maven**: Dependency management and build tool
- **Lombok**: Reduces boilerplate code

---

## Troubleshooting

### Common Issues:

1. **"mvn command not found"**
   - Add Maven to PATH environment variable

2. **"Java version error"**
   - Ensure JAVA_HOME points to Java 17

3. **"Port already in use"**
   - Change `server.port` in application.properties

4. **"H2 console connection failed"**
   - Ensure JDBC URL is: `jdbc:h2:mem:dsatracker`

5. **"Validation errors"**
   - Ensure required fields (title, topic, difficulty, status) are provided

---

## Next Steps

1. **Learn each component** thoroughly
2. **Add more features** (search, filtering, categories)
3. **Create a frontend** (React, Angular, or simple HTML)
4. **Add authentication** for multi-user support
5. **Deploy to cloud** (Heroku, AWS, etc.)

---

## Complete File List

After following all steps, your project should have:

```
MyDSA-Tracker/
├── pom.xml (52 lines)
├── src/main/java/com/dsatracker/
│   ├── DsaTrackerApplication.java (11 lines)
│   ├── controller/ProblemController.java (67 lines)
│   ├── service/ProblemService.java (65 lines)
│   ├── repository/ProblemRepository.java (8 lines)
│   └── entity/
│       ├── Problem.java (37 lines)
│       ├── Difficulty.java (5 lines)
│       └── Status.java (5 lines)
└── src/main/resources/application.properties (12 lines)
```

**Total: 9 files, ~263 lines of code**

This is your complete, working Spring Boot REST API for DSA problem tracking!</content>
<parameter name="filePath">c:\Users\sumay\DSA Tracker\COMPLETE_GUIDE.md