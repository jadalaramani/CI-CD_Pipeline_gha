# CI-CD_Pipeline_gha

##  Test Locally

```bash
# Go into app folder
cd app

# Install dependencies
npm install

# Start app locally
npm start
```

Visit 👉 [http://localhost:3000](http://localhost:3000)
Output:

```
🚀 NPM CI/CD Project is running on EKS!
```

Health check 👉 [http://localhost:3000/health](http://localhost:3000/health)


## 🖥️ **Option 1: Create ECR Repository from AWS Console**

### **Step 1:** Open ECR Service

1. Log in to your **AWS Management Console**.
2. In the search bar, type **ECR** and open **Elastic Container Registry**.

---

### **Step 2:** Create a New Repository

1. Click **“Create repository”**.
2. Choose:

   * **Visibility settings** → select:

     * ✅ *Private* (default) for internal use, or
     * 🌐 *Public* for public access.
3. Under **Repository name**, enter your repo name — for example:

   ```
   todo-app-backend
   ```
4. (Optional) Configure:

   * **Tag immutability** → Prevent overwriting image tags.
   * **Scan on push** → Enable automatic vulnerability scanning.
   * **Encryption** → Leave as default (KMS or AES-256).

---

### **Step 3:** Create Repository

1. Click **Create repository**.
2. You’ll see a success message and your new repository will appear in the list.

---

## 🧭 **Steps to Create a Slack Webhook URL**

### **Step 1: Go to Slack API Page**

1. Open your browser and go to:
   🔗 [https://api.slack.com/apps](https://api.slack.com/apps)
2. Click **“Create New App”** → then choose
   **→ From scratch**.

---

### **Step 2: App Setup**

1. Enter an **App Name** (e.g., `Jenkins_Notifier` or `AWS_Alerts`).
2. Select the **Slack Workspace** where you want to send messages.
3. Click **Create App**.

---

### **Step 3: Enable Incoming Webhooks**

1. In the left sidebar, go to **“Incoming Webhooks”**.
2. Toggle **“Activate Incoming Webhooks”** → **ON**.
3. Scroll down → click **“Add New Webhook to Workspace.”**

---

### **Step 4: Choose a Slack Channel**

1. Select the channel (e.g., `#devops-alerts` or `#ci-cd-notifications`) where messages will appear.
2. Click **Allow**.

---

### **Step 5: Copy the Webhook URL**

You’ll now see a URL like this:

```
https://hooks.slack.com/services/XXXXXXXXXXXXXXXXXXXXXXXX
```

✅ **This is your Slack Webhook URL** — copy it securely.

---

### **Step 6: Test Your Webhook**

You can test it with `curl`:

```bash
curl -X POST -H 'Content-type: application/json' \
--data '{"text":"✅ Slack Webhook Test: CI/CD Pipeline Triggered"}' \
https://hooks.slack.com/services/XXXXXXXXXXXXXXXXXXXXXXXX
```
