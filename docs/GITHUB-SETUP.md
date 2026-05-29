# הוראות העלאה ל-GitHub Pages

## שלב 1 — צור חשבון GitHub (אם אין לך)
פתח את https://github.com/signup

## שלב 2 — צור Repository חדש
1. לחץ על **+** (פינה שמאלית עליונה) → **New repository**
2. **Repository name:** `sieners-pricing`
3. בחר **Public**
4. לחץ **Create repository**

## שלב 3 — העלה את קבצי ה-PWA
בדף ה-Repository החדש:
1. לחץ על **uploading an existing file**
2. גרור את כל קבצי תיקיית `pwa/` (index.html, manifest.json, sw.js, תיקיית icons/)
3. לחץ **Commit changes**

## שלב 4 — הפעל GitHub Pages
1. לחץ על **Settings** (בדף ה-Repository)
2. בתפריט השמאלי לחץ **Pages**
3. תחת **Source** בחר **Deploy from a branch**
4. Branch: **main** | Folder: **/ (root)**
5. לחץ **Save**

## שלב 5 — קבל את הקישור
אחרי ~2 דקות הקישור יהיה:
```
https://YOUR-USERNAME.github.io/sieners-pricing
```

## שלב 6 — הוסף לאייפון
1. פתח את הקישור ב-**Safari** (חייב Safari, לא Chrome)
2. לחץ על **Share** (כפתור השיתוף ⬆️)
3. לחץ **"Add to Home Screen"** (הוסף למסך הבית)
4. לחץ **Add**

האפליקציה תופיע על מסך הבית כמו כל אפליקציה רגילה!

---

## עדכון בעתיד
כשתרצה לעדכן — שנה את `pwa/index.html` ואז:
1. ב-GitHub לחץ על הקובץ
2. לחץ על עיפרון ✏️ לעריכה
3. הדבק את הגרסה החדשה
4. **Commit changes** — העדכון יופיע אוטומטית
