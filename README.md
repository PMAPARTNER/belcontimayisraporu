# Belconti Resort Hotel — Aylık Dijital Performans Raporu

**Canlı:** https://belcontiaylikrapor.netlify.app  
**Hazırlayan:** PMA Partner

---

## Kurulum

Repo'yu klonla:
```bash
git clone https://github.com/PMAPARTNER/belcontimayisraporu.git
cd belcontimayisraporu
```

## Deploy

`deploy.sh` scripti `index.html` dosyasını GitHub'a push eder.
Netlify otomatik olarak canlıya alır.

```bash
chmod +x deploy.sh
./deploy.sh
```

### Gereksinimler
- macOS / Linux terminal
- `curl` ve `python3` (macOS'ta varsayılan olarak yüklü)
- Geçerli GitHub Personal Access Token (`deploy.sh` içinde)

### Token Güncelleme
Token süresi doldugunda:
1. https://github.com/settings/tokens → **Generate new token (classic)**
2. Yetki: `repo` (tam erişim)
3. `deploy.sh` içindeki `GITHUB_TOKEN` satırını güncelle

## Netlify Bağlantısı

Site Netlify'da GitHub reposuna bağlı:
- **Site:** belcontiaylikrapor.netlify.app
- **Site ID:** 7629d8cf-1c81-40b5-b1b8-3d2c410a929f
- **Branch: main - her push otomatik deploy olur

## Rapor Yapısı

```
index.html     → Tüm rapor (tek dosya, self-contained)
deploy.sh      → GitHub'a push scripti
CLAUDE.md      → Claude talimatları (otomatik deploy dahil)
README.md      → Bu dosya
```

## Veri Kaynakları

| Bölüm | Kaynak |
|-------|--------|
| Web Trafjği | Google Analytics 4 |
| Google Ads | Google Reklam Raporu.xlsx |
| Meta Reklamlar | Meta Business Suite |
| Web Rezervasyon | Opera PMS |
| Call Center | Çağrı Merkezi CRM |
