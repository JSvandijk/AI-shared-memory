# Learnings

Accumulated findings from each project. Newest first.
After each project or review, add a new entry here.

---

## 2026-04-23 · t3code-mobile · Claude Opus review of ChatGPT 5.4 output

**Project:** Android WebView wrapper + HTTPS proxy for T3 Code
**Review type:** Full public-readiness review by Claude Opus on ChatGPT 5.4-generated code

### What was found

1. **Self-audit missed self-introduced bugs.** ChatGPT wrote a security audit that named info-disclosure and XSS as risks, then shipped code with both: filesystem paths in health endpoint, unescaped HTML templates, no CSP headers.

2. **Documentation substituted for testing.** 18+ markdown files, zero unit tests, zero Android tests. The project looked thorough on the surface but had no executable verification beyond a smoke test.

3. **Deprecated APIs used on current target SDK.** `FLAG_FULLSCREEN` (deprecated API 30) and `onBackPressed()` (deprecated API 33) used with `targetSdkVersion 35`. Immediately visible to any Android reviewer.

4. **Service worker cached everything.** Including navigation responses that could contain sensitive session data. No allowlist, no cache scoping.

5. **Error handlers silently swallowed failures.** `catch (e) { /* ignore */ }` on decompression — corrupted data passed through silently.

6. **Uncommitted work across multiple sessions.** 2+ sessions of security fixes existed only as local modifications. One `git checkout .` would have destroyed all of it.

7. **Evidence drift.** Evidence referenced an older commit while the code had moved forward with security-critical changes.

8. **README had duplicate sections.** "Proof And Assets" and "Community And Support" shared 10+ identical links. Classic AI over-generation pattern.

### Lessons extracted

- AI code + AI audit in the same pass don't catch each other's mistakes. External review is essential.
- Volume of documentation is not correlated with quality. Ratio of tests to docs matters.
- "Works locally" ≠ "done" — especially for security changes.
- Small code smells (duplicate cache entries, warning suppression) erode reviewer trust disproportionately.
- AI agents reliably add but rarely subtract. Explicitly check for things to remove.

### Fixes applied

- Extracted `escapeHtml` + `injectBeforeHeadClose` to testable module with 18 unit tests
- Added CSP headers, response limits, decompression error handling, health endpoint caching
- Replaced deprecated Android APIs with modern equivalents
- Restricted service worker to static asset allowlist
- Removed info-disclosure from health endpoint and startup logs
- Cleaned up README duplicate sections

---

## Template for new entries

```markdown
## YYYY-MM-DD · project-name · context

**Project:** one-line description
**Review type:** what kind of review

### What was found
1. finding
2. finding

### Lessons extracted
- lesson
- lesson

### Fixes applied
- fix
- fix
```
