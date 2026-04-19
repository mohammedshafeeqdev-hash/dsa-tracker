# 🚀 Complete DSA Tracker Application Guide
## Build Your Own Spring Boot REST API from Scratch

> **🎯 Goal**: Create a personal DSA problem tracking system with clean architecture

---

## 📋 Prerequisites Checklist

### ✅ 1. Java 17 Installation
```bash
# Download from: https://adoptium.net/
# Install and verify:
java -version
# Expected: Java 17.x.x
```

### ✅ 2. Maven Installation
```bash
# Download from: https://maven.apache.org/download.cgi
# Add to PATH and verify:
mvn -version
# Expected: Apache Maven 3.9.x
```

### ✅ 3. VS Code Setup
- **Download**: https://code.visualstudio.com/
- **Required Extensions**:
  - ☕ Java Extension Pack
  - 🌱 Spring Boot Extension Pack

---

## 🏗️ Project Structure Overview

```
📁 MyDSA-Tracker/
├── 📄 pom.xml
├── 📁 src/main/java/com/dsatracker/
│   ├── 📄 DsaTrackerApplication.java
│   ├── 📁 controller/ProblemController.java
│   ├── 📁 service/ProblemService.java
│   ├── 📁 repository/ProblemRepository.java
│   └── 📁 entity/
│       ├── 📄 Problem.java
│       ├── 📄 Difficulty.java
│       └── 📄 Status.java
└── 📁 src/main/resources/application.properties
```

---

## 🎯 Step-by-Step Implementation

### 📦 Step 1: Project Configuration (pom.xml)

**Location**: `MyDSA-Tracker/pom.xml`

```xml
<?xml version="1.0" encoding="UTF-8"?>
<project xmlns="http://maven.apache.org/POM/4.0.0"
         xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
         xsi:schemaLocation="http://maven.apache.org/POM/4.0.0
         https://maven.apache.org/xsd/maven-4.0.0.xsd">
    <modelVersion>4.0.0</modelVersion>

    <!-- 🎭 Spring Boot Parent Configuration -->
    <parent>
        <groupId>org.springframework.boot</groupId>
        <artifactId>spring-boot-starter-parent</artifactId>
        <version>3.2.0</version>
        <relativePath/>
    </parent>

    <!-- 📋 Project Metadata -->
    <groupId>com.dsatracker</groupId>
    <artifactId>dsa-tracker</artifactId>
    <version>0.0.1-SNAPSHOT</version>
    <name>dsa-tracker</name>
    <description>My Personal DSA Tracker</description>

    <!-- ⚙️ Java Version Configuration -->
    <properties>
        <java.version>17</java.version>
    </properties>

    <!-- 📚 Dependencies -->
    <dependencies>
        <!-- 🌐 Web Framework -->
        <dependency>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-starter-web</artifactId>
        </dependency>

        <!-- 🗄️ Database Layer -->
        <dependency>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-starter-data-jpa</artifactId>
        </dependency>

        <!-- ✅ Input Validation -->
        <dependency>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-starter-validation</artifactId>
        </dependency>

        <!-- 💾 In-Memory Database -->
        <dependency>
            <groupId>com.h2database</groupId>
            <artifactId>h2</artifactId>
            <scope>runtime</scope>
        </dependency>

        <!-- 🔧 Code Generation -->
        <dependency>
            <groupId>org.projectlombok</groupId>
            <artifactId>lombok</artifactId>
            <optional>true</optional>
        </dependency>

        <!-- 🧪 Testing Framework -->
        <dependency>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-starter-test</artifactId>
            <scope>test</scope>
        </dependency>
    </dependencies>

    <!-- 🛠️ Build Configuration -->
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

**🎨 What This Does**:
- 📦 **Packaging**: Defines project structure
- 🎭 **Spring Boot**: Provides auto-configuration
- 📚 **Dependencies**: Libraries for web, database, validation
- 🛠️ **Build**: Maven compilation settings

---

### 🚀 Step 2: Application Entry Point

**Location**: `src/main/java/com/dsatracker/DsaTrackerApplication.java`

```java
package com.dsatracker;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication  // 🎭 Magic annotation!
public class DsaTrackerApplication {

    public static void main(String[] args) {
        SpringApplication.run(DsaTrackerApplication.class, args);
    }
}
```

**🎨 Key Points**:
- 🎭 `@SpringBootApplication` = Auto-configuration + Component scanning
- 🚀 `main()` method starts the entire application
- 📦 Scans for components in `com.dsatracker` package

---

### 📊 Step 3: Data Models (Entities)

#### 🎯 Difficulty Enum
**Location**: `src/main/java/com/dsatracker/entity/Difficulty.java`

```java
package com.dsatracker.entity;

public enum Difficulty {
    EASY,     // 🟢 Simple problems
    MEDIUM,   // 🟡 Moderate difficulty
    HARD      // 🔴 Challenging problems
}
```

#### 📊 Status Enum
**Location**: `src/main/java/com/dsatracker/entity/Status.java`

```java
package com.dsatracker.entity;

public enum Status {
    NOT_SOLVED,  // ❌ Haven't attempted
    SOLVED,      // ✅ Successfully solved
    REVISION     // 🔄 Needs review
}
```

#### 🏗️ Main Problem Entity
**Location**: `src/main/java/com/dsatracker/entity/Problem.java`

```java
package com.dsatracker.entity;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import lombok.Data;

@Entity                    // 🗄️ Database table
@Data                      // 🔧 Auto-generates getters/setters
@Table(name = "problems")  // 📋 Table name
public class Problem {

    @Id                                      // 🆔 Primary key
    @GeneratedValue(strategy = GenerationType.IDENTITY)  // 🔢 Auto-increment
    private Long id;

    @NotBlank(message = "Title is required")    // 📝 Required field
    private String title;

    @NotBlank(message = "Topic is required")    // 🏷️ Required field
    private String topic;

    @NotNull(message = "Difficulty is required") // 🎯 Required field
    @Enumerated(EnumType.STRING)                 // 💾 Store as text
    private Difficulty difficulty;

    private String description;  // 📖 Optional description

    private String link;         // 🔗 Optional LeetCode link

    @NotNull(message = "Status is required")     // 📊 Required field
    @Enumerated(EnumType.STRING)
    private Status status;

    @Column(columnDefinition = "TEXT")  // 📜 Large text field
    private String code;        // 💻 Solution code

    @Column(columnDefinition = "TEXT")
    private String notes;       // 📝 Personal notes

    @Column(columnDefinition = "TEXT")
    private String mistakes;    // ⚠️ Common mistakes
}
```

**🎨 Entity Features**:
- 🗄️ `@Entity` → Maps to database table
- 🔧 `@Data` → Generates boilerplate code
- ✅ **Validation**: `@NotBlank`, `@NotNull`
- 📊 **Enums**: Stored as strings in DB
- 📜 **TEXT columns**: For large content

---

### 🗄️ Step 4: Data Access Layer (Repository)

**Location**: `src/main/java/com/dsatracker/repository/ProblemRepository.java`

```java
package com.dsatracker.repository;

import com.dsatracker.entity.Problem;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository  // 📚 Marks as repository component
public interface ProblemRepository extends JpaRepository<Problem, Long> {
    // 🎭 Spring Boot provides all CRUD operations automatically!
    // ✨ No implementation needed - magic happens here!
}
```

**🎨 Repository Powers** (Auto-provided):
- 💾 `save()` - Create/Update
- 🔍 `findById()` - Read by ID
- 📋 `findAll()` - Read all
- 🗑️ `deleteById()` - Delete
- ✅ `existsById()` - Check existence

---

### 🔧 Step 5: Business Logic Layer (Service)

**Location**: `src/main/java/com/dsatracker/service/ProblemService.java`

```java
package com.dsatracker.service;

import com.dsatracker.entity.Problem;
import com.dsatracker.entity.Status;
import com.dsatracker.repository.ProblemRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service  // 🔧 Business logic component
public class ProblemService {

    @Autowired  // 🔗 Dependency injection
    private ProblemRepository problemRepository;

    // 📋 Get all problems
    public List<Problem> getAllProblems() {
        return problemRepository.findAll();
    }

    // 🔍 Get problem by ID
    public Optional<Problem> getProblemById(Long id) {
        return problemRepository.findById(id);
    }

    // ➕ Create new problem
    public Problem createProblem(Problem problem) {
        return problemRepository.save(problem);
    }

    // ✏️ Update existing problem
    public Problem updateProblem(Long id, Problem problemDetails) {
        Optional<Problem> optionalProblem = problemRepository.findById(id);
        if (optionalProblem.isPresent()) {
            Problem problem = optionalProblem.get();
            // 🔄 Update all fields
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
        return null;  // 🚫 Problem not found
    }

    // 🗑️ Delete problem
    public boolean deleteProblem(Long id) {
        if (problemRepository.existsById(id)) {
            problemRepository.deleteById(id);
            return true;  // ✅ Successfully deleted
        }
        return false;  // 🚫 Problem not found
    }

    // 📊 Update only status
    public Problem updateStatus(Long id, Status status) {
        Optional<Problem> optionalProblem = problemRepository.findById(id);
        if (optionalProblem.isPresent()) {
            Problem problem = optionalProblem.get();
            problem.setStatus(status);
            return problemRepository.save(problem);
        }
        return null;  // 🚫 Problem not found
    }
}
```

**🎨 Service Responsibilities**:
- 🔧 **Business Logic**: Data processing and validation
- 🔗 **Dependency Injection**: Repository access
- 📊 **Data Transformation**: Prepare data for controller
- ✅ **Error Handling**: Null checks and responses

---

### 🌐 Step 6: API Layer (Controller)

**Location**: `src/main/java/com/dsatracker/controller/ProblemController.java`

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

@RestController              // 🌐 REST API controller
@RequestMapping("/problems") // 🛣️ All endpoints start with /problems
public class ProblemController {

    @Autowired
    private ProblemService problemService;

    // 📋 GET /problems - List all problems
    @GetMapping
    public List<Problem> getAllProblems() {
        return problemService.getAllProblems();
    }

    // 🔍 GET /problems/{id} - Get specific problem
    @GetMapping("/{id}")
    public ResponseEntity<Problem> getProblemById(@PathVariable Long id) {
        Optional<Problem> problem = problemService.getProblemById(id);
        return problem.map(value -> new ResponseEntity<>(value, HttpStatus.OK))
                      .orElseGet(() -> new ResponseEntity<>(HttpStatus.NOT_FOUND));
    }

    // ➕ POST /problems - Create new problem
    @PostMapping
    public ResponseEntity<Problem> createProblem(@Valid @RequestBody Problem problem) {
        Problem createdProblem = problemService.createProblem(problem);
        return new ResponseEntity<>(createdProblem, HttpStatus.CREATED);
    }

    // ✏️ PUT /problems/{id} - Update problem
    @PutMapping("/{id}")
    public ResponseEntity<Problem> updateProblem(@PathVariable Long id, @Valid @RequestBody Problem problemDetails) {
        Problem updatedProblem = problemService.updateProblem(id, problemDetails);
        if (updatedProblem != null) {
            return new ResponseEntity<>(updatedProblem, HttpStatus.OK);
        }
        return new ResponseEntity<>(HttpStatus.NOT_FOUND);
    }

    // 🗑️ DELETE /problems/{id} - Delete problem
    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteProblem(@PathVariable Long id) {
        boolean deleted = problemService.deleteProblem(id);
        if (deleted) {
            return new ResponseEntity<>(HttpStatus.NO_CONTENT);
        }
        return new ResponseEntity<>(HttpStatus.NOT_FOUND);
    }

    // 📊 PUT /problems/{id}/status - Update status only
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

**🎨 API Endpoints**:
| Method | Endpoint | Description |
|--------|----------|-------------|
| 📋 GET | `/problems` | List all problems |
| 🔍 GET | `/problems/{id}` | Get specific problem |
| ➕ POST | `/problems` | Create new problem |
| ✏️ PUT | `/problems/{id}` | Update problem |
| 🗑️ DELETE | `/problems/{id}` | Delete problem |
| 📊 PUT | `/problems/{id}/status` | Update status |

---

### ⚙️ Step 7: Application Configuration

**Location**: `src/main/resources/application.properties`

```properties
# 🗄️ H2 Database Configuration
spring.datasource.url=jdbc:h2:mem:dsatracker
spring.datasource.driverClassName=org.h2.Driver
spring.datasource.username=sa
spring.datasource.password=password

# ⚙️ JPA/Hibernate Configuration
spring.jpa.database-platform=org.hibernate.dialect.H2Dialect
spring.jpa.hibernate.ddl-auto=update
spring.jpa.show-sql=true

# 🔍 H2 Console (for development)
spring.h2.console.enabled=true

# 🌐 Server Configuration
server.port=8080
```

**🎨 Configuration Breakdown**:
- 🗄️ **Database**: H2 in-memory database
- ⚙️ **JPA**: Auto-create tables, show SQL queries
- 🔍 **H2 Console**: Web interface for database
- 🌐 **Server**: Run on port 8080

---

## 🚀 Launch Sequence

### 🛠️ Build the Application
```bash
# Navigate to project folder
cd MyDSA-Tracker

# Download dependencies and compile
mvn clean install
```

### ▶️ Run the Application
```bash
# Start Spring Boot application
mvn spring-boot:run
```

**Expected Output**:
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

## 🧪 Testing Your API

### 🌐 Check Server Status
- **URL**: `http://localhost:8080/problems`
- **Expected**: `[]` (empty array)

### 🔍 Access H2 Database Console
- **URL**: `http://localhost:8080/h2-console`
- **JDBC URL**: `jdbc:h2:mem:dsatracker`
- **Username**: `sa`
- **Password**: `password`

### 📝 Test API Endpoints

#### ➕ Create a Problem
```bash
curl -X POST http://localhost:8080/problems \
  -H "Content-Type: application/json" \
  -d '{
    "title": "Two Sum",
    "topic": "Array",
    "difficulty": "EASY",
    "status": "NOT_SOLVED",
    "description": "Find two numbers that add up to target",
    "code": "public int[] twoSum(int[] nums, int target) { ... }",
    "notes": "Use HashMap for O(n) solution"
  }'
```

#### 📋 Get All Problems
```bash
curl http://localhost:8080/problems
```

#### 📊 Update Status
```bash
curl -X PUT http://localhost:8080/problems/1/status \
  -H "Content-Type: application/json" \
  -d '{"status": "SOLVED"}'
```

---

## 🔄 Application Flow Diagram

```
🌐 Client Request
    ↓
🎯 Controller Layer
    ↓
🔧 Service Layer (Business Logic)
    ↓
🗄️ Repository Layer
    ↓
💾 Database (H2)
    ↓
🔄 Response Flow Back
```

---

## 🛠️ Troubleshooting Guide

| Problem | Solution |
|---------|----------|
| ❌ `mvn command not found` | Add Maven to PATH |
| ❌ `Java version error` | Set JAVA_HOME to Java 17 |
| ❌ `Port 8080 in use` | Change `server.port` in properties |
| ❌ `H2 connection failed` | Check JDBC URL: `jdbc:h2:mem:dsatracker` |
| ❌ `Validation errors` | Ensure required fields: title, topic, difficulty, status |

---

## 📊 Project Statistics

- 📁 **Total Files**: 9
- 📝 **Lines of Code**: ~263
- 🏗️ **Architecture**: Layered (Controller → Service → Repository → Entity)
- 🗄️ **Database**: H2 In-Memory
- 🌐 **API Endpoints**: 6
- ✅ **Validation**: Built-in
- 🔧 **Build Tool**: Maven

---

## 🎓 Learning Path

### 🟢 Beginner Level ✅
- ✅ Spring Boot basics
- ✅ REST API creation
- ✅ JPA entity mapping
- ✅ Maven project structure

### 🟡 Intermediate Level 🚧
- 🔄 Add search/filtering
- 🔄 User authentication
- 🔄 File upload for code
- 🔄 Pagination

### 🟠 Advanced Level 🎯
- 🎯 Microservices architecture
- 🎯 Docker containerization
- 🎯 Cloud deployment
- 🎯 Performance optimization

---

## 🎉 Success Checklist

- [ ] Java 17 installed
- [ ] Maven installed
- [ ] VS Code with extensions
- [ ] Project structure created
- [ ] All files implemented
- [ ] Application builds successfully
- [ ] Server starts on port 8080
- [ ] API endpoints working
- [ ] H2 console accessible
- [ ] Can create/read/update/delete problems

---

## 🚀 What's Next?

1. **🎨 Create a Frontend** (React/Vue/HTML)
2. **🔐 Add Authentication** (Spring Security)
3. **📱 Make it Mobile-Friendly**
4. **☁️ Deploy to Cloud** (Heroku/AWS)
5. **📊 Add Analytics** (Progress tracking)

**🎊 Congratulations!** You now have a fully functional Spring Boot REST API for DSA problem tracking!

---

*Built with ❤️ for learning Spring Boot*