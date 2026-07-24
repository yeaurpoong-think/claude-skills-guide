Write-Host "🚀 SR바이오텍 Claude Code 조직 스킬 설치를 시작합니다..." -ForegroundColor Cyan
Write-Host ""

# 0) 사전 체크
if (-not (Get-Command claude -ErrorAction SilentlyContinue)) {
  Write-Host "❌ Claude Code CLI가 설치되어 있지 않습니다. 먼저 설치해주세요: npm install -g @anthropic-ai/claude-code" -ForegroundColor Red
  exit 1
}

if (-not (Get-Command npx -ErrorAction SilentlyContinue)) {
  Write-Host "❌ Node.js/npx가 필요합니다. Node 20+ 설치 후 다시 시도해주세요." -ForegroundColor Red
  exit 1
}

Write-Host "1️⃣ Plugin 마켓플레이스 등록 및 설치 (marketing-skills / superpowers / ui-ux-design-pro)"
claude plugin marketplace add coreyhaines31/marketingskills
claude plugin install marketing-skills@marketingskills

claude plugin marketplace add obra/superpowers
claude plugin install superpowers@superpowers-dev

claude plugin marketplace add ca-who-codes/ultimate.UIUX.design.skills
claude plugin install ui-ux-design-pro@ultimate-uiux-design-skills

Write-Host ""
Write-Host "2️⃣ npx skills 방식 설치 (Design DNA / Web Animation / Three.js / Remotion / MengTo 종합 스킬 / Superpowers Lab)"
npx skills add zanwei/design-dna -a claude-code -g -y
npx skills add iart-ai/web-animation-skills -a claude-code -g -y
npx skills add CloudAI-X/threejs-skills -a claude-code -g -y
npx skills add remotion-dev/skills -a claude-code -g -y
npx skills add MengTo/Skills -a claude-code -g -y
npx skills add obra/superpowers-lab -a claude-code -g -y

Write-Host ""
Write-Host "✅ 설치 완료! Claude Code를 재시작하면 스킬이 자동 활성화됩니다." -ForegroundColor Green
$skillCount = (Get-ChildItem "$env:USERPROFILE\.claude\skills" -Directory -ErrorAction SilentlyContinue).Count
Write-Host "   설치된 스킬 수: $skillCount 개 (~/.claude/skills)"
Write-Host "   설치된 플러그인: claude plugin list 로 확인하세요."
