# 🚀 DSA Problem Tracker - Complete Full-Stack Application

A comprehensive Spring Boot application for tracking personal DSA (Data Structures and Algorithms) problems with a beautiful web interface.

## 🎯 Features

### Backend (Spring Boot)
- ✅ Add, view, update, and delete DSA problems
- ✅ Track problem status (NOT_SOLVED, SOLVED, REVISION)
- ✅ Store code, notes, and mistakes for each problem
- ✅ RESTful APIs for problem management
- ✅ Input validation and error handling

### Frontend (Modern Web UI)
- 🎨 **Beautiful Dashboard**: Real-time statistics and progress tracking
- 📱 **Responsive Design**: Works on desktop and mobile
- ➕ **Interactive Forms**: Add/edit problems with validation
- 👁️ **Detailed Views**: Full problem information display
- 📊 **Visual Cards**: Color-coded difficulty and status indicators
- 🔄 **Auto-refresh**: Real-time updates every 30 seconds

## 🛠️ Technologies Used

### Backend
- ☕ **Java 17** - Programming language
- 🚀 **Spring Boot 3.2.0** - Framework
- 🗄️ **Spring Data JPA** - Data persistence
- 💾 **H2 Database** - In-memory database
- ✅ **Spring Validation** - Input validation
- 🔧 **Lombok** - Code generation
- 📦 **Maven** - Build tool

### Frontend
- 🌐 **HTML5/CSS3** - Structure and styling
- 🎨 **Bootstrap 5** - Responsive framework
- ✨ **Font Awesome** - Icons
- 🔧 **Vanilla JavaScript** - Interactivity
- 🎯 **Fetch API** - HTTP requests

## 📋 Prerequisites

- ☕ **Java 17** or higher
- 🔧 **Maven 3.6+**
- 🌐 **Modern web browser** (Chrome, Firefox, Safari, Edge)

## 🚀 Quick Start

### 1. Install Prerequisites

#### Install Java 17
1. Download from: https://adoptium.net/temurin/releases/
2. Choose **JDK 17** for your operating system
3. Install and verify: `java -version`

#### Install Maven
1. Download from: https://maven.apache.org/download.cgi
2. Add to PATH and verify: `mvn -version`

### 2. Run the Application

```bash
cd "C:\Users\sumay\DSA Tracker"
mvn clean install
mvn spring-boot:run
```

### 3. Access Your Application

#### 🌐 **Web Interface** (Main UI)
- **URL**: `http://localhost:8080`
- **Features**: Dashboard, add/edit problems, statistics

#### 🗄️ **H2 Database Console**
- **URL**: `http://localhost:8080/h2-console`
- **Login**: `sa` / `password`

## 🎨 UI Features

### 📊 Dashboard
- **Total Problems**: Complete count
- **Solved Count**: Successfully completed
- **Pending Tasks**: Not yet solved
- **Completion Rate**: Progress percentage

### 💳 Problem Management
- **Visual Cards**: Modern card-based layout
- **Color Coding**: Easy (🟢), Medium (🟡), Hard (🔴)
- **Status Badges**: Clear status indicators
- **Quick Actions**: View, Edit, Delete buttons

### 📝 Interactive Forms
- **Add Problem**: Complete form with all fields
- **Edit Problem**: Pre-populated editing
- **View Details**: Full-screen problem viewer
- **Form Validation**: Required field checking

## 🔗 API Endpoints

| Method | Endpoint | Description |
|--------|----------|-------------|
| 📋 GET | `/problems` | List all problems |
| 🔍 GET | `/problems/{id}` | Get specific problem |
| ➕ POST | `/problems` | Create new problem |
| ✏️ PUT | `/problems/{id}` | Update problem |
| 🗑️ DELETE | `/problems/{id}` | Delete problem |
| 📊 PUT | `/problems/{id}/status` | Update status only |

## �️ Quick Start Scripts

- **`run.bat`**: Run locally with prerequisites check
- **`deploy_to_github.bat`**: Push code to GitHub for deployment
- **`add_sample_data.bat`**: Add demo problems to your app

## �📁 Project Structure

```
📁 DSA Tracker/
├── 📄 pom.xml                           # Maven configuration
├── 📁 src/main/java/com/dsatracker/
│   ├── 📄 DsaTrackerApplication.java    # Main application
│   ├── 📁 controller/ProblemController.java  # REST endpoints
│   ├── 📁 service/ProblemService.java   # Business logic
│   ├── 📁 repository/ProblemRepository.java # Data access
│   └── 📁 entity/                        # Data models
│       ├── 📄 Problem.java
│       ├── 📄 Difficulty.java
│       └── 📄 Status.java
├── 📁 src/main/resources/
│   ├── 📄 application.properties        # App configuration
│   └── 📁 static/index.html             # 🎨 Web UI
├── 📄 STYLISH_GUIDE.md                  # Beautiful guide
└── 📄 COMPLETE_GUIDE.md                 # Detailed guide
```

## 🧪 Testing

### Add Sample Data
```bash
curl -X POST http://localhost:8080/problems \
  -H "Content-Type: application/json" \
  -d '{
    "title": "Two Sum",
    "topic": "Array",
    "difficulty": "EASY",
    "status": "SOLVED",
    "description": "Find two numbers that add up to target"
  }'
```

### Check API
```bash
curl http://localhost:8080/problems
```

## 🚀 Deployment Options

### Local Development
```bash
mvn spring-boot:run
```

### JAR File
```bash
mvn clean package
java -jar target/dsa-tracker-0.0.1-SNAPSHOT.jar
```

### Docker (Now Available!)
```bash
# Build Docker image
docker build -t dsa-tracker .

# Run container
docker run -p 8080:8080 dsa-tracker
```

### Free Hosting (Recommended!)
Your app can be deployed to **free platforms**:

#### **🏆 Railway (Easiest)**
1. Push code to GitHub (`deploy_to_github.bat`)
2. Go to [Railway.app](https://railway.app)
3. "New Project" → "Deploy from GitHub"
4. Select your repository → Deploy!
5. **Free URL**: `https://your-app.up.railway.app`

#### **📖 Full Guide**: Check `FREE_HOSTING_GUIDE.md`

## 🆘 Troubleshooting

| Problem | Solution |
|---------|----------|
| `mvn: command not found` | Add Maven to PATH |
| `Java version error` | Install Java 17, set JAVA_HOME |
| `Port 8080 in use` | Change port in application.properties |
| `UI not loading` | Check backend is running |
| `Database issues` | Check H2 console access |

## 🎯 Learning Outcomes

This project demonstrates:
- ✅ **Spring Boot** application development
- ✅ **REST API** design and implementation
- ✅ **JPA/Hibernate** for database operations
- ✅ **Layered Architecture** (Controller → Service → Repository)
- ✅ **Modern Web UI** with responsive design
- ✅ **Full-Stack Development** workflow

## 🚀 What's Next?

### Immediate Goals
- [x] Backend API ✅
- [x] Web UI ✅
- [x] Database setup ✅
- [ ] Deploy to cloud

### Enhancement Ideas
- 🔐 **User Authentication**
- 📱 **Mobile App** (React Native)
- ☁️ **Cloud Deployment** (Heroku/AWS)
- 📊 **Advanced Analytics**
- 🔗 **LeetCode Integration**
- 👥 **Social Features**

---

## 🎉 Success!

You now have a complete **full-stack DSA tracking application**!

**To get started:**
1. Install Java 17 and Maven
2. Run `mvn spring-boot:run`
3. Open `http://localhost:8080`
4. Start tracking your DSA journey! 🚀

**Need help?** Check the `STYLISH_GUIDE.md` for detailed instructions!
- `PUT /problems/{id}` - Update a problem
- `DELETE /problems/{id}` - Delete a problem
- `PUT /problems/{id}/status` - Update problem status

## Example Request

### Create Problem
```json
POST /problems
{
  "title": "Two Sum",
  "topic": "Array",
  "difficulty": "EASY",
  "description": "Find two numbers that add up to target",
  "link": "https://leetcode.com/problems/two-sum/",
  "status": "NOT_SOLVED",
  "code": "// Solution code here",
  "notes": "Use hashmap for O(n) solution",
  "mistakes": "Forgot to handle duplicates"
}
```

### Update Status
```json
PUT /problems/{id}/status
{
  "status": "SOLVED"
}
```

## Project Structure

- `entity/` - JPA entities (Problem, enums)
- `repository/` - Data access layer
- `service/` - Business logic
- `controller/` - REST API endpoints