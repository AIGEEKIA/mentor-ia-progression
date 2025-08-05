#!/bin/bash

echo "🚀 Installation du système Mentor IA..."
echo "======================================"

# Couleurs pour l'affichage
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Fonction pour afficher les messages
print_status() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

print_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Vérifier si Git est installé
if ! command -v git &> /dev/null; then
    print_error "Git n'est pas installé. Veuillez l'installer d'abord."
    exit 1
fi

print_status "Git est installé ✓"

# Vérifier si Node.js est installé
if ! command -v node &> /dev/null; then
    print_warning "Node.js n'est pas installé. Certains outils ne fonctionneront pas."
else
    print_status "Node.js est installé ✓"
fi

# Créer la structure du projet
print_status "Création de la structure du projet..."

# Créer les dossiers principaux
mkdir -p docs templates examples tools
mkdir -p examples/code-standards examples/projets-progression examples/contenu-youtube
mkdir -p tools/scripts-setup tools/config-eslint tools/hooks-git

print_success "Structure de dossiers créée ✓"

# Copier les fichiers de configuration
print_status "Copie des fichiers de configuration..."

# Copier le prompt système
if [ -f "templates/prompt-systeme.txt" ]; then
    cp templates/prompt-systeme.txt ~/mentor-ia-prompt.txt
    print_success "Prompt système copié dans ~/mentor-ia-prompt.txt ✓"
else
    print_warning "Fichier prompt-systeme.txt non trouvé"
fi

# Copier les règles Cursor
if [ -f "templates/cursor-rules.md" ]; then
    cp templates/cursor-rules.md ~/.cursorrules
    print_success "Règles Cursor copiées dans ~/.cursorrules ✓"
else
    print_warning "Fichier cursor-rules.md non trouvé"
fi

# Créer le fichier .cursorrules s'il n'existe pas
if [ ! -f ".cursorrules" ]; then
    cat > .cursorrules << 'EOF'
# 🎯 RÈGLES CURSOR - ACCOMPAGNEMENT PROGRESSION

Tu es le mentor technique et business de l'utilisateur, spécialisé dans le développement web moderne.

TES RÈGLES :
1. TOUJOURS adapter le niveau à son expertise actuelle
2. EXPLIQUER le "pourquoi" avant le "comment"
3. FOURNIR du code fonctionnel et des exemples pratiques
4. LIER technique et business dans chaque conseil
5. SUGGÉRER du contenu YouTube réutilisable
6. ENCOURAGER l'expérimentation et l'apprentissage actif
7. RESPECTER nos standards de qualité (accessibilité, performance, SEO)
8. POSER des questions pour vérifier sa compréhension
9. FÉLICITER ses progrès et encourager la confiance
10. PROPOSER des exercices pratiques et des défis

AIDE-LE À :
- Maîtriser les technologies modernes
- Créer du contenu de valeur
- Construire sa notoriété
- Développer ses opportunités business
- Devenir une référence dans son domaine
EOF
    print_success "Fichier .cursorrules créé ✓"
fi

# Créer le fichier package.json pour les outils
if [ ! -f "package.json" ]; then
    cat > package.json << 'EOF'
{
  "name": "mentor-ia-progression",
  "version": "1.0.0",
  "description": "Système complet d'accompagnement technique et business",
  "main": "index.js",
  "scripts": {
    "setup": "bash tools/scripts-setup/setup-mentor.sh",
    "lint": "eslint . --ext .js,.jsx,.ts,.tsx",
    "test": "jest",
    "lighthouse": "lighthouse http://localhost:3000 --output html --output-path ./lighthouse-report.html"
  },
  "keywords": [
    "mentor",
    "progression",
    "technique",
    "business",
    "youtube",
    "standards"
  ],
  "author": "AIGEEKIA",
  "license": "MIT",
  "devDependencies": {
    "eslint": "^8.0.0",
    "prettier": "^2.8.0",
    "husky": "^8.0.0",
    "lint-staged": "^13.0.0",
    "@typescript-eslint/parser": "^5.0.0",
    "@typescript-eslint/eslint-plugin": "^5.0.0",
    "eslint-plugin-jsx-a11y": "^6.0.0"
  }
}
EOF
    print_success "package.json créé ✓"
fi

# Créer le fichier .gitignore
if [ ! -f ".gitignore" ]; then
    cat > .gitignore << 'EOF'
# Dependencies
node_modules/
npm-debug.log*
yarn-debug.log*
yarn-error.log*

# Production
build/
dist/
.next/
out/

# Environment variables
.env
.env.local
.env.development.local
.env.test.local
.env.production.local

# IDE
.vscode/
.idea/
*.swp
*.swo

# OS
.DS_Store
Thumbs.db

# Logs
*.log

# Runtime data
pids
*.pid
*.seed
*.pid.lock

# Coverage directory used by tools like istanbul
coverage/

# Lighthouse reports
lighthouse-report.html
EOF
    print_success ".gitignore créé ✓"
fi

# Créer le fichier README.md s'il n'existe pas
if [ ! -f "README.md" ]; then
    print_warning "README.md non trouvé. Veuillez le créer manuellement."
fi

print_success "Installation terminée !"
echo ""
echo "📝 Prochaines étapes :"
echo "1. Copiez le prompt système dans vos notes"
echo "2. Utilisez-le à chaque interaction avec l'IA"
echo "3. Suivez les standards de développement"
echo "4. Créez du contenu YouTube"
echo "5. Mesurez vos progrès"
echo ""
echo "🎯 Bonne progression !" 