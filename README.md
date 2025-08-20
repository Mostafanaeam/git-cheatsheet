# ملخّص أوامر Git/GitHub – شرح تفصيلي بالعربي

> الملف يحتوي على شرح لكل سطر ظاهر في `index.html` بنفس الترتيب، مع ملاحظات سريعة للحفظ.

---

## 1) Setup & Config
**الفكرة:** تعريف هويتك محليًا عشان كل Commit يبقى موقّع باسمك وإيميلك.

- `git config --global user.name "Your Name"`  
  يضبط اسمك على مستوى الجهاز كله (global). يتخزن في الملف `~/.gitconfig`.  
  *متى أستخدمه؟* أول مرة تثبّت Git أو لما تغيّر اسمك المعروض في الـ commits.

- `git config --global user.email "you@example.com"`  
  يضبط الإيميل اللي هيظهر في سجل الـ commits. لازم يكون نفس الإيميل اللي رابط بيه حساب GitHub لو عايز تُنسب المساهمات لحسابك.

- `git config --list`  
  يعرض كل الإعدادات الحالية (system / global / local). لو فيه إعداد مكرر، آخر قيمة هي الفعالة.  
  > مفيد للتأكد إن الاسم والإيميل اتحطّوا صح.

---

## 2) Starting a Repo
**الفكرة:** تبدأ مشروع جديد محليًا أو تنسخ مشروع موجود من GitHub.

- `git init` — **Start new local repo**  
  بيحوّل المجلد الحالي لمستودع Git (ينشئ مجلد `.git`). استخدمه مرة واحدة في بداية المشروع.

- `git clone <url>` — **Clone repo from GitHub**  
  ينزّل نسخة كاملة من مستودع موجود (بالتاريخ والفروع) ويضبط الـ remote تلقائيًا باسم `origin`.

**ذاكرة سريعة:**  
Init = إنشاء محلي. Clone = تنزيل من بعيد.

---

## 3) Basic Workflow
**الفكرة:** دورة الحياة اليومية: شوف التغييرات ⟶ جهّزها ⟶ ثبّتها.

- `git status` — **Check status**  
  يوضح الملفات المعدلة/غير المتتبعة، والفرع الحالي، وحالة الـ staging.

- `git add <file>` — **Stage a file**  
  يضيف ملف واحد لمنطقة الـ staging علشان يدخل في الـ commit القادم.

- `git add .` — **Stage all changes**  
  يضيف كل التغييرات في المجلد الحالي (بما فيها ملفات جديدة).

- `git commit -m "message"` — **Commit staged changes**  
  يثبّت التغييرات كنسخة محفوظة في التاريخ برسالة واضحة. الرسالة لازم توضّح *ماذا ولماذا*.

- `git log` — **Show commit history**  
  يعرض سجل الـ commits بالترتيب الزمني. (اضغط `q` للخروج من العرض.)

**ذاكرة سريعة:**  
Status = شوف. Add = جهّز. Commit = ثبّت. Log = التاريخ.

---

## 4) Branching
**الفكرة:** فروع لعزل العمل ودمجه بأمان.

- `git branch` — **List branches**  
  يعرض الفروع المحلية. الفرع الحالي عليه نجمة `*`.

- `git branch <name>` — **Create new branch**  
  ينشئ فرع جديد دون التبديل إليه.

- `git checkout <name>` — **Switch to branch**  
  يبدّل للفرع المطلوب. (بديل حداثي: `git switch <name>`.)

- `git checkout -b <name>` — **Create + switch branch**  
  ينشئ فرعًا جديدًا ويبدّل إليه في خطوة واحدة. (بديل: `git switch -c <name>`.)

- `git merge <branch>` — **Merge branch into current**  
  يدمج تغييرات فرع آخر في الفرع الحالي. عالج التعارضات إن ظهرت ثم اعمل commit.

- `git branch -d <name>` — **Delete branch**  
  يحذف الفرع محليًا (لو متدمج). استخدم `-D` للحذف القسري لو لسه مش متدمج.

**ذاكرة سريعة:**  
`checkout -b` = (أنشئ + بدّل). Merge = ضمّ للشجرة.

---

## 5) Remote (GitHub)
**الفكرة:** ربط المستودع المحلي بـ GitHub ورفع/سحب التغييرات.

- `git remote -v` — **Show remotes**  
  يبيّن العناوين المرتبطة بالمستودع (fetch/push).

- `git remote add origin <url>` — **Add remote origin**  
  يربط المستودع بعنوان GitHub تحت اسم `origin` (المعتاد).

- `git push -u origin main` — **Push first time**  
  أول رفع لفرع `main` ويضبط «upstream» بحيث تقدر بعد كده تستخدم `git push` و`git pull` من غير تحديد عنوان.

- `git push` — **Push changes**  
  يرفع آخر commits للفرع المرتبط على GitHub.

- `git pull` — **Pull latest changes**  
  يعمل `fetch` ثم `merge` تلقائيًا من الفرع البعيد إلى المحلي.

- `git fetch` — **Fetch branches/tags**  
  ينزّل آخر التحديثات بدون دمج. استخدمه لو عايز تراجع الاختلافات قبل الدمج.

**ذاكرة سريعة:**  
Push = رفع. Pull = تنزيل + دمج. Fetch = تنزيل فقط.

---

## 6) Undo & Fix
**الفكرة:** تراجع بأمان حسب مكان الخطأ (working dir / staging / history).

- `git checkout -- <file>` — **Discard changes (before staging)**  
  يلغي تعديلات ملف في الـ working directory ويعيده لآخر نسخة من HEAD.  
  > بديل حديث مفضل: `git restore <file>`.

- `git reset HEAD <file>` — **Unstage a file**  
  يفك الملف من الـ staging فقط (لا يمس تعديلاتك في working dir).  
  > بديل حديث: `git restore --staged <file>`.

- `git reset --hard HEAD` — **Reset to last commit (erases changes)**  
  *خطر* يمسح كل التعديلات غير المثبتة ويعيد الحالة لآخر commit. لا يُستخدم إن كان عندك شغل لم تحفظه.

- `git revert <commit>` — **New commit that undoes a commit**  
  ينشئ commit جديد يعكس تغييرات commit معين بدون حذف التاريخ. آمن على الفروع المشتركة.

**ذاكرة سريعة:**  
Restore/checkout = ارجع ملف. Reset = فك/امسح. Revert = عكس آمن بتاريخ جديد.

---

## 7) Stash
**الفكرة:** ركن تغييراتك مؤقتًا للانتقال السريع بين المهام.

- `git stash` — **Save uncommitted changes**  
  يخزن تعديلاتك على هيئة «stash» ويعيد الشجرة نظيفة.

- `git stash pop` — **Reapply last stash**  
  يطبق آخر stash ويمسحه من القائمة.

- `git stash list` — **Show stashes**  
  يعرض كل العناصر المخزنة مؤقتًا (`stash@{0}`, `stash@{1}`, …).

**نصيحة:** استخدم رسائل: `git stash push -m "work on X"` لسهولة التذكّر.

---

## 8) Tags
**الفكرة:** علامات لإصدار نسخة محددة من الكود.

- `git tag v1.0` — **Create tag**  
  ينشئ «lightweight tag». يفضّل غالبًا استخدام tag موثّق:  
  `git tag -a v1.0 -m "Release v1.0"` لاسم وتفاصيل ثابتة.

- `git tag` — **List tags**  
  يعرض كل العلامات.

- `git push origin v1.0` — **Push tag to GitHub**  
  يرفع tag واحد. لرفع الكل: `git push --tags`.

---

## خرائط ذهنية سريعة للحفظ
- **الحياة اليومية:** `status → add → commit → push`  
- **تبديل/إنشاء فرع:** `checkout -b feature-x` ثم `merge` للـ main عند الانتهاء.  
- **تراجع سريع:**  
  - رجّع ملف = `restore`/`checkout -- file`  
  - فك من staging = `reset HEAD file`  
  - امسح كل حاجة غير محفوظة = `reset --hard HEAD` (حذر!)  
  - اعكس commit منشور = `revert`

---

## ملاحظات عامة
- الأوامر هنا تعمل مع Git ≥ 2.x. البدائل الحديثة (`switch`/`restore`) أنظف، لكن تم الإبقاء على الأوامر الظاهرة في الصورة حرفيًا.
- دايمًا اكتب رسائل Commit واضحة وقصيرة. مثال: `feat: add login form`، `fix: handle empty state`.
- لو بتشتغل بفريق: اعمل `pull` قبل الشغل، و`push` بعد كل مجموعة منطقية من التغييرات.

موفّق ✨

---
# إضافات عملية

## 1) Git Aliases (اختصارات عملية)
بدل ما تكتب أوامر طويلة، تقدر تعرّف alias مرة واحدة في config.

```bash
# افتح config عالمي
git config --global alias.st status
git config --global alias.co checkout
git config --global alias.br branch
git config --global alias.cm "commit -m"
git config --global alias.last "log -1 HEAD"
git config --global alias.unstage "reset HEAD --"
```

**مثال عملي:**  
- `git st` ⟶ بدل `git status`  
- `git co feature-x` ⟶ بدل `git checkout feature-x`  
- `git last` ⟶ يجيب آخر commit سريعًا

---

## 2) ورقة عمل: سيناريوهات سريعة (لو حصل X → اعمل Y)

| الموقف (X) | الحل (Y) |
|------------|-----------|
| كتبت كود غلط ومش عايز تحفظه | `git checkout -- file` أو `git restore file` |
| ضفت ملف غلط للـ staging | `git reset HEAD file` |
| محتاج تلغي آخر commit محليًا بس | `git reset --soft HEAD~1` |
| محتاج تلغي commit منشور | `git revert <commit>` |
| عندك تغييرات بس عايز تغيّر فرع | `git stash` ثم `git checkout branch` ثم `git stash pop` |
| عايز تحديث من GitHub بس من غير دمج | `git fetch` |
| دمج حصل فيه conflicts | عدّل الملفات يدويًا ثم `git add . && git commit` |
| عايز ترفع كل الـ tags مرة واحدة | `git push --tags` |

---

## 3) سكربت إعداد سريع (bash)

ملف `git-setup.sh`:

```bash
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
```

**الاستخدام:**  
1. خزّن الملف باسم `git-setup.sh`.  
2. اعمل له صلاحيات تنفيذ: `chmod +x git-setup.sh`.  
3. شغّله: `./git-setup.sh`.  

## ✍️ الخاتمة  
الملف ده اتعمل علشان يبسط أوامر Git ويخليها في متناول أي مطوّر، سواء لسه بادئ أو عنده خبرة وعايز مرجع سريع.  
الشرح كله معمول بالعربي علشان يوصل بسهولة، ومعاه أمثلة عملية وسيناريوهات من الحياة الواقعية.  

أنا **Mostafa Abd El-naeam**، مطوّر MEAN Stack ومدرّب في البرمجة وتطوير الذات.  
بؤمن إن أي معلومة لو اتقدمت بشكل بسيط ومنظّم، بتوفّر على المطوّر وقت ومجهود وبتخليه يركز على الإبداع بدل ما يضيع في التفاصيل.  

لو لقيت إن الملف ده ساعدك، شاركه مع غيرك، وطوّره وزوّد عليه.  
لأن المعرفة اللي بتتشارك = معرفة بتعيش وتكبر. 🚀  

