# 🧪 Testing Checklist for Resume Website

## Before Deployment
Use this checklist to ensure everything works perfectly!

---

## 1️⃣ Local Testing (Before Upload)

### Basic Functionality
- [ ] Open `index.html` in browser
- [ ] Google Docs embedded correctly
- [ ] Download button appears (bottom-right)
- [ ] Download button works (exports PDF)
- [ ] Responsive on mobile (test with DevTools)

### Favicon Check
- [ ] Browser tab shows icon
- [ ] Icon appears when bookmarking

---

## 2️⃣ After Deployment Testing

### Test Sites & URLs
📌 **Your Resume URL**: `https://resume.harshsingh.io/`

### A. SEO Meta Tags

**1. Google Search Console**
- [ ] Go to https://search.google.com/search-console
- [ ] Add property: `https://resume.harshsingh.io/`
- [ ] Submit sitemap: `https://resume.harshsingh.io/sitemap.xml`
- [ ] Request indexing

**2. Google Rich Results Test**
- [ ] Visit: https://search.google.com/test/rich-results
- [ ] Enter: `https://resume.harshsingh.io/`
- [ ] Verify "Person" schema is detected
- [ ] Check for errors

**3. Schema Validator**
- [ ] Visit: https://validator.schema.org/
- [ ] Enter URL or paste HTML
- [ ] Verify no errors in JSON-LD

---

### B. Open Graph Previews (Social Media)

**1. Facebook / Meta Debugger** 🔵
- [ ] Visit: https://developers.facebook.com/tools/debug/
- [ ] Enter: `https://resume.harshsingh.io/`
- [ ] Click "Scrape Again"
- [ ] Verify preview shows:
  - Your preview image
  - Correct title
  - Correct description

**2. LinkedIn Preview** 💼
- [ ] Open LinkedIn
- [ ] Create a new post (don't publish yet)
- [ ] Paste: `https://resume.harshsingh.io/`
- [ ] Verify card preview appears correctly
- [ ] Cancel post (or publish if you want!)

**3. Twitter/X Card Validator** 🐦
- [ ] Visit: https://cards-dev.twitter.com/validator
  *(Note: May require Twitter Developer account)*
- [ ] Or: Tweet the link and check preview
- [ ] Verify large image card appears

**4. WhatsApp Test** 💚
- [ ] Open WhatsApp (mobile or web)
- [ ] Send link to yourself or a friend
- [ ] Verify preview shows image and text

**5. Telegram Test** ✈️
- [ ] Open Telegram
- [ ] Send link: `https://resume.harshsingh.io/`
- [ ] Verify instant preview appears

**6. Slack Test** 💼
- [ ] Paste link in any Slack channel
- [ ] Verify unfurling preview appears

---

### C. PWA (Progressive Web App)

**Mobile Testing** (Chrome Android / Safari iOS)
- [ ] Open `https://resume.harshsingh.io/` on mobile
- [ ] Look for "Add to Home Screen" prompt
- [ ] Tap "Add to Home Screen"
- [ ] Check home screen for app icon
- [ ] Open app from home screen
- [ ] Verify it opens in standalone mode (no browser UI)
- [ ] Check if purple theme color appears in status bar

**Desktop Testing** (Chrome)
- [ ] Open in Chrome desktop
- [ ] Look for install icon in address bar (⊕)
- [ ] Click to install
- [ ] Verify it opens as desktop app

---

### D. Favicons (All Devices)

**Desktop Browsers**
- [ ] Chrome - Tab icon visible
- [ ] Firefox - Tab icon visible
- [ ] Safari - Tab icon visible
- [ ] Edge - Tab icon visible

**Bookmark Test**
- [ ] Bookmark the page
- [ ] Check bookmark bar for icon
- [ ] Check bookmarks menu for icon

**Mobile Browsers**
- [ ] Chrome Android - Icon in tab
- [ ] Safari iOS - Icon in tab
- [ ] Add to home screen - Icon appears

---

### E. Performance & Loading

**PageSpeed Insights**
- [ ] Visit: https://pagespeed.web.dev/
- [ ] Enter: `https://resume.harshsingh.io/`
- [ ] Check mobile score
- [ ] Check desktop score
- [ ] Aim for 90+ scores

**GTmetrix**
- [ ] Visit: https://gtmetrix.com/
- [ ] Analyze: `https://resume.harshsingh.io/`
- [ ] Check performance grade

---

### F. Cross-Browser Testing

**Desktop**
- [ ] Chrome (latest)
- [ ] Firefox (latest)
- [ ] Safari (latest)
- [ ] Edge (latest)

**Mobile**
- [ ] Chrome Android
- [ ] Safari iOS
- [ ] Samsung Internet
- [ ] Firefox Mobile

---

### G. Accessibility

**WAVE Tool**
- [ ] Visit: https://wave.webaim.org/
- [ ] Enter: `https://resume.harshsingh.io/`
- [ ] Check for accessibility errors
- [ ] Fix any critical issues

**Lighthouse Audit** (Chrome DevTools)
- [ ] Open DevTools (F12)
- [ ] Go to "Lighthouse" tab
- [ ] Run audit for:
  - Performance
  - Accessibility
  - Best Practices
  - SEO
- [ ] Aim for 90+ in all categories

---

### H. Metadata Verification

**View Page Source**
- [ ] Right-click → "View Page Source"
- [ ] Verify all meta tags are present
- [ ] Check Open Graph tags load
- [ ] Check Twitter Card tags load
- [ ] Verify JSON-LD scripts are present

**Browser Console**
- [ ] Open DevTools Console (F12)
- [ ] Check for any errors (should be none)
- [ ] Check for 404s in Network tab

---

### I. Sitemap & Robots.txt

**Robots.txt**
- [ ] Visit: `https://resume.harshsingh.io/robots.txt`
- [ ] Verify it loads correctly
- [ ] Check sitemap reference is correct

**Sitemap.xml**
- [ ] Visit: `https://resume.harshsingh.io/sitemap.xml`
- [ ] Verify XML loads correctly
- [ ] Check URL is correct
- [ ] Verify image reference works

**Submit to Search Engines**
- [ ] Google Search Console - Submit sitemap
- [ ] Bing Webmaster Tools - Submit sitemap

---

## 3️⃣ Maintenance Checklist (Monthly)

- [ ] Update `lastmod` date in `sitemap.xml`
- [ ] Re-scrape Facebook/LinkedIn if content changed
- [ ] Check Google Search Console for crawl errors
- [ ] Verify SSL certificate is valid
- [ ] Test all links still work
- [ ] Check if preview image still loads

---

## 🎯 Success Criteria

Your resume website is ready when:

✅ All social media platforms show correct previews  
✅ Google Rich Results Test passes  
✅ PWA installs successfully on mobile  
✅ All favicons appear correctly  
✅ PageSpeed score is 90+  
✅ Zero console errors  
✅ Download button works  
✅ Responsive on all devices  

---

## 🐛 Common Issues & Fixes

### Issue: Social media preview not updating
**Fix**: Clear cache on platform debugger tools

### Issue: PWA not installing
**Fix**: 
- Ensure HTTPS is enabled
- Check `manifest.json` path is correct
- Verify all icon paths exist

### Issue: Favicon not showing
**Fix**:
- Clear browser cache (Ctrl+Shift+Delete)
- Hard reload (Ctrl+Shift+R)
- Check file paths are relative/correct

### Issue: Google not indexing
**Fix**:
- Submit to Google Search Console
- Request indexing manually
- Check robots.txt isn't blocking

---

## 📊 Analytics Setup (Optional)

After all tests pass, consider adding:

### Google Analytics 4
```html
<!-- Add to <head> in index.html -->
<script async src="https://www.googletagmanager.com/gtag/js?id=G-XXXXXXXXXX"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());
  gtag('config', 'G-XXXXXXXXXX');
</script>
```

### Plausible Analytics (Privacy-friendly)
```html
<script defer data-domain="resume.harshsingh.io" src="https://plausible.io/js/script.js"></script>
```

---

## 🎉 Ready to Go Live!

Once all checkboxes are ✅, your resume is:
- SEO optimized
- Social media ready
- PWA enabled
- Performance optimized
- Accessible to all

**Share it with confidence!** 🚀
