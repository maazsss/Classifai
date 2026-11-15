# Put Classifai online for free

One free service runs the whole site (the website and the server together), and one free database keeps your accounts and customers.

## Before you start
- Do NOT put `.env` or any API key on GitHub. You will type the keys into the host's "secrets" page instead.
- Free hosts change their rules sometimes. If a page looks different, look for the same word (Secrets / Environment).
- Free hosting is for a demo. Real customer data should not go to a free host.

## Part A: the database (Neon, free)
1. Go to neon.tech and sign up with your GitHub account.
2. Create a project named `classifai`. Copy the **connection string** (starts with `postgresql://`). Keep it private.

## Part B: the website and server (Render, free)
1. Add the two files from this folder (`Dockerfile`, `.dockerignore`) to the **top** of your Classifai project (next to `backend` and `frontend`).
   In the PyCharm terminal:
       git add Dockerfile .dockerignore
       git commit -m "Add Dockerfile for hosting"
       git push
2. Go to render.com, sign up with GitHub, choose **New > Web Service**, pick the `Classifai` repo.
3. Language: **Docker**. Instance type: **Free**.
4. Under **Environment Variables** add:
       DATABASE_URL   = the Neon connection string
       GEMINI_API_KEY = your Gemini key (only if you want Pandu's AI answers)
   (If you use the Bluesminds key instead, add BLUESMINDS_API_KEY and BLUESMINDS_MODEL.)
5. Click **Create Web Service**. The first build takes about 10 minutes. When it says Live, open the address Render shows (like https://classifai.onrender.com).
6. Create your account on the sign-up page of that address.

## What to expect on the free plan
- The site **sleeps after 15 minutes without visitors**. The next visit waits about a minute to wake up. Open it a few minutes before you show anyone.
- Your data is safe in Neon, because the host's own disk is wiped on every restart.
- Anyone with the link can open the sign-in page. Only people who sign up can see data, and the AI key is spent when they chat with Pandu.

## Other free option
Hugging Face Spaces (create a **Docker** Space and upload the same files) does not sleep as quickly, but the steps differ. Ask and I'll write them.
