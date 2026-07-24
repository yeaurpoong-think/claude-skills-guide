#!/usr/bin/env bash
# SR바이오텍 조직 Claude Code 스킬 일괄 설치 스크립트
# 사용법: curl -fsSL https://yeaurpoong-think.github.io/claude-skills-guide/install-org-skills.sh | bash
set -e

echo "🚀 SR바이오텍 Claude Code 조직 스킬 설치를 시작합니다..."
echo ""

# 0) 사전 체크
if ! command -v claude &> /dev/null; then
  echo "❌ Claude Code CLI가 설치되어 있지 않습니다. 먼저 설치해주세요: npm install -g @anthropic-ai/claude-code"
  exit 1
fi

if ! command -v npx &> /dev/null; then
  echo "❌ Node.js/npx가 필요합니다. Node 20+ 설치 후 다시 시도해주세요."
  exit 1
fi

echo "1️⃣ Plugin 마켓플레이스 등록 및 설치 (marketing-skills / superpowers / ui-ux-design-pro)"
claude plugin marketplace add coreyhaines31/marketingskills || true
claude plugin install marketing-skills@marketingskills || true

claude plugin marketplace add obra/superpowers || true
claude plugin install superpowers@superpowers-dev || true

claude plugin marketplace add ca-who-codes/ultimate.UIUX.design.skills || true
claude plugin install ui-ux-design-pro@ultimate-uiux-design-skills || true

echo ""
echo "2️⃣ npx skills 방식 설치 (Design DNA / Web Animation / Three.js / Remotion / MengTo 종합 스킬 / Superpowers Lab)"
npx skills add zanwei/design-dna -a claude-code -g -y || true
npx skills add iart-ai/web-animation-skills -a claude-code -g -y || true
npx skills add CloudAI-X/threejs-skills -a claude-code -g -y || true
npx skills add remotion-dev/skills -a claude-code -g -y || true
npx skills add MengTo/Skills -a claude-code -g -y || true
npx skills add obra/superpowers-lab -a claude-code -g -y || true

echo ""
echo "✅ 설치 완료! Claude Code를 재시작하면 스킬이 자동 활성화됩니다."
echo "   설치된 스킬 수: $(ls ~/.claude/skills 2>/dev/null | wc -l)개 (~/.claude/skills)"
echo "   설치된 플러그인: claude plugin list 로 확인하세요."
