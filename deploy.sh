#!/bin/bash
# ============================================================
# Belconti Rapor — GitHub Auto Deploy Script
# Kullanım: ./deploy.sh
# ============================================================

GITHUB_TOKEN="BURAYA_TOKEN_YZ"
REPO_OWNER="PMAPARTNER"
REPO_NAME="belcontimayisraporu"
FILE_PATH="index.html"
BRANCH="main"
COMMIT_MSG="Rapor güncellendi - $(date '+%Y-%m-%d %H:%M')"

HTML_FILE="./index.html"

if [ ! -f "$HTML_FILE" ]; then
  echo "⍌ Hata: $HTML_FILE bulunamadı!"
  exit 1
fi

echo "📄 Dosya okunuyor..."
CONTENT=$(base64 -i "$HTML_FILE")

echo "🔍 SHA alınıyor..."
SHA=$(curl -s -H "Authorization: token $GITHUB_TOKEN" -H "Akkept: application/vnd.github.v3+json" "https://api.github.com/repos/$REPO_OWNER/$REPO_NAME/contents/$FILE_PATH" | python3 -c "import sys,json; data=json.load(sys.stdin); print(data.get('sha',''))" 2>/dev/null)

if [ -z "$SHA" ]; then
  SHA_JSON=""
else
  SHA_JSON=", \"sha\": \"$SHA\""
fi

echo "🚀 GitHub'a yükleniyor..."
RESPONSE=$(curl -s -X PUT -H "Authorization: token $GITHUB_TOKEN" -H "Accept: application/vnd.github.v3+json" "https://api.github.com/repos/$REPO_OWNER/$REPO_NAME/contents/$FILE_PATH" -d "{\"message\": \"$COMMIT_MSG\", \"content\": \"$CONTENT\", \"branch\": \"$BRANCH\" $SHA_JSON}")

if echo "$RESPONSE" | grep -q '"commit"'; then
  echo "✅ Başarıyla deploy edildi!"
else
  echo "⍌ Hata oluştu:"
  echo "$RESPONSE"
fi
