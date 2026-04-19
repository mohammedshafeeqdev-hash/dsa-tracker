# 🚀 Deploy DSA Tracker to Free Hosting

## Option 1: Railway (Recommended for Spring Boot)

### Step 1: Create Railway Account
1. Go to https://railway.app
2. Sign up with GitHub
3. Connect your GitHub account

### Step 2: Deploy Your App
1. Click "New Project" → "Deploy from GitHub repo"
2. Connect your DSA Tracker repository
3. Railway will auto-detect Java/Spring Boot
4. It will build and deploy automatically!

### Step 3: Configure Database
Railway provides free PostgreSQL database:
1. Add "PostgreSQL" plugin in Railway dashboard
2. Update `application.properties`:
```properties
spring.datasource.url=${DATABASE_URL}
spring.datasource.username=${DATABASE_USERNAME}
spring.datasource.password=${DATABASE_PASSWORD}
spring.jpa.database-platform=org.hibernate.dialect.PostgreSQLDialect
```

### Step 4: Access Your App
- **URL**: `https://your-project-name.up.railway.app`
- **Free Tier**: 512MB RAM, 1GB storage

---

## Option 2: Render (Alternative)

### Step 1: Create Render Account
1. Go to https://render.com
2. Sign up (free tier available)

### Step 2: Deploy from GitHub
1. Connect your GitHub repo
2. Choose "Web Service"
3. Select Java runtime
4. Set build command: `./mvnw clean install`
5. Set start command: `java -jar target/*.jar`

### Step 3: Free Tier Limits
- 750 hours/month
- Auto-sleep after 15 minutes of inactivity

---

## Option 3: Fly.io (Docker Option)

### Step 1: Install Fly CLI
```bash
# Download from: https://fly.io/docs/hands-on/install-flyctl/
```

### Step 2: Create Dockerfile
```dockerfile
FROM openjdk:17-jdk-slim
WORKDIR /app
COPY target/*.jar app.jar
EXPOSE 8080
CMD ["java", "-jar", "app.jar"]
```

### Step 3: Deploy
```bash
fly launch
fly deploy
```

### Free Tier: 3 shared CPUs, 256MB RAM

---

## Quick Start with Railway (Easiest):

### 1. Push Your Code to GitHub
```bash
git init
git add .
git commit -m "Initial commit"
git branch -M main
git remote add origin https://github.com/yourusername/dsa-tracker.git
git push -u origin main
```

### 2. Deploy on Railway
1. Go to https://railway.app
2. "New Project" → "Deploy from GitHub"
3. Select your repository
4. Wait for deployment (usually 2-3 minutes)

### 3. Your App is Live!
- **URL**: `https://dsa-tracker-production.up.railway.app`
- **Database**: Add PostgreSQL plugin for persistence

---

## Frontend-Only Option (Cheaper):

If you want to separate frontend and backend:

### Backend: Railway/Render (Free)
### Frontend: Netlify/Vercel (Free)

### 1. Extract Frontend
Move `src/main/resources/static/index.html` to separate project

### 2. Deploy Frontend to Netlify
1. Go to https://netlify.com
2. Drag & drop your HTML/CSS/JS files
3. Get free HTTPS URL instantly

### 3. Update API Calls
Change `http://localhost:8080` to your Railway/Render backend URL

---

## Cost Comparison:

| Platform | Free Tier | Build Time | Database |
|----------|-----------|------------|----------|
| Railway | 512MB RAM | Fast | PostgreSQL |
| Render | 750 hrs/month | Medium | PostgreSQL |
| Fly.io | 256MB RAM | Docker | External |
| Netlify | Unlimited | Instant | None |

---

## Pro Tips:

1. **Environment Variables**: Store secrets in platform settings
2. **Health Checks**: Add `/problems` endpoint for monitoring
3. **Logs**: Check platform dashboards for debugging
4. **Scaling**: Free tiers auto-scale but have limits

---

## Your Next Steps:

1. **Push code to GitHub**
2. **Choose Railway** (easiest for Spring Boot)
3. **Deploy in 5 minutes**
4. **Share your live app** with friends!

**Which option interests you most?** 🚀