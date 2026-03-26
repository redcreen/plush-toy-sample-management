#!/bin/bash

# Skill版本管理脚本
# 用法: ./version-manager.sh [major|minor|patch]

SKILL_NAME="plush-toy-sample-management"
REPO_DIR="/Users/redcreen/.openclaw/workspace-order/skills-repo"
SKILL_DIR="$REPO_DIR/$SKILL_NAME"
INSTALL_DIR="/usr/local/lib/node_modules/openclaw/skills/$SKILL_NAME"

cd "$REPO_DIR"

# 获取当前版本
CURRENT_VERSION=$(git describe --tags --abbrev=0 2>/dev/null || echo "v0.0.0")
echo "当前版本: $CURRENT_VERSION"

# 解析版本号
MAJOR=$(echo $CURRENT_VERSION | cut -d. -f1 | tr -d 'v')
MINOR=$(echo $CURRENT_VERSION | cut -d. -f2)
PATCH=$(echo $CURRENT_VERSION | cut -d. -f3)

# 根据参数更新版本
if [ "$1" == "major" ]; then
    MAJOR=$((MAJOR + 1))
    MINOR=0
    PATCH=0
elif [ "$1" == "minor" ]; then
    MINOR=$((MINOR + 1))
    PATCH=0
elif [ "$1" == "patch" ]; then
    PATCH=$((PATCH + 1))
else
    echo "用法: $0 [major|minor|patch]"
    exit 1
fi

NEW_VERSION="v$MAJOR.$MINOR.$PATCH"
echo "新版本: $NEW_VERSION"

# 备份当前版本到tag
echo "创建备份tag: $CURRENT_VERSION"
git tag -a "$CURRENT_VERSION" -m "Backup before $NEW_VERSION"

# 提交当前修改
echo "提交修改..."
git add .
git commit -m "Update to $NEW_VERSION"

# 创建新tag
echo "创建新tag: $NEW_VERSION"
git tag -a "$NEW_VERSION" -m "Release $NEW_VERSION"

# 打包skill
echo "打包skill..."
cd "$REPO_DIR/.."
python3 /usr/local/lib/node_modules/openclaw/skills/skill-creator/scripts/package_skill.py "$SKILL_NAME"

# 安装新版本
echo "安装新版本..."
sudo rm -rf "$INSTALL_DIR"
sudo unzip -q "$SKILL_NAME.skill" -d "$INSTALL_DIR"

echo "完成！新版本 $NEW_VERSION 已安装"
echo ""
echo "推送命令:"
echo "  cd $REPO_DIR"
echo "  git push origin master --tags"
