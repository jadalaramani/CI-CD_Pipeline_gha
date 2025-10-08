const express = require('express');
const app = express();
const PORT = process.env.PORT || 3000;

// Middleware (optional)
app.use(express.json());

// Routes
app.get('/', (req, res) => {
  res.send('🚀 NPM CI/CD Project is running on EKS!');
});

// Optional health check route
app.get('/health', (req, res) => {
  res.json({ status: 'ok', service: 'npm-cicd-project' });
});

// Start server
app.listen(PORT, () => {
  console.log(`✅ Server started on port ${PORT}`);
});
