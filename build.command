#!/bin/bash
# סקריפט בנייה — Sieners Pricing
# לחץ פעמיים כדי להריץ

cd "$(dirname "$0")"

echo "================================================"
echo "  Sieners SYV Group — בניית אפליקציית תמחור"
echo "================================================"
echo ""

# בדוק Node.js
if ! command -v node &> /dev/null; then
  echo "❌ שגיאה: Node.js לא מותקן"
  read -p "לחץ Enter לסגירה..."
  exit 1
fi
echo "✅ Node.js $(node -v)"

# התקן תלויות
echo ""
echo "📦 מתקין תלויות (npm install)..."
npm install

if [ $? -ne 0 ]; then
  echo "❌ npm install נכשל"
  read -p "לחץ Enter לסגירה..."
  exit 1
fi
echo "✅ תלויות הותקנו"

# נקה extended attributes (מונע שגיאת codesign)
echo ""
echo "🧹 מנקה extended attributes ו-cache..."
xattr -cr .
xattr -dr com.apple.quarantine ~/Library/Caches/electron 2>/dev/null || true
xattr -dr com.apple.quarantine ~/Library/Caches/electron-builder 2>/dev/null || true

# נקה build ישן
rm -rf /tmp/sieners-build

# בנה DMG
echo ""
echo "🔨 בונה DMG ל-macOS..."
npm run build-mac

if [ $? -ne 0 ]; then
  echo "❌ הבנייה נכשלה"
  read -p "לחץ Enter לסגירה..."
  exit 1
fi

echo ""
echo "📋 מעתיק DMG לתיקיית הפרויקט..."
cp /tmp/sieners-build/*.dmg "$(dirname "$0")/" 2>/dev/null && echo "✅ DMG הועתק לתיקיית הפרויקט!" || echo "⚠ לא ניתן להעתיק — הקובץ נמצא ב /tmp/sieners-build/"

echo ""
echo "================================================"
echo "  ✅ הבנייה הושלמה! הקובץ נמצא בתיקיית הפרויקט"
echo "================================================"
read -p "לחץ Enter לסגירה..."
