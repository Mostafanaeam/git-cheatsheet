#!/bin/bash
# Quick Git project setup script

echo "🚀 Setting up new Git project..."

# 1. Ask user name & email
read -p "Enter your name: " uname
read -p "Enter your email: " uemail

git config --global user.name "$uname"
git config --global user.email "$uemail"

# 2. Init repo
git init

# 3. Create first commit
echo "# New Project" > README.md
git add README.md
git commit -m "Initial commit"

# 4. Ask for GitHub URL
read -p "Enter GitHub repo URL (or leave blank): " url
if [ ! -z "$url" ]; then
  git remote add origin "$url"
  git branch -M main
  git push -u origin main
fi

echo "✅ Done! Git repo is ready."
