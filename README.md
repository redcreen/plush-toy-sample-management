# Plush Toy Sample Management - 版本管理说明

## 当前版本
**v1.0.0** (2026-03-26)

## 本地Git仓库
位置：`/Users/redcreen/.openclaw/workspace-order/skills-repo/`

## 版本管理脚本

### 使用方法

```bash
cd /Users/redcreen/.openclaw/workspace-order/skills-repo

# 小版本更新（v1.0.0 -> v1.0.1）
./version-manager.sh patch

# 次版本更新（v1.0.0 -> v1.1.0）
./version-manager.sh minor

# 主版本更新（v1.0.0 -> v2.0.0）
./version-manager.sh major
```

### 脚本功能
1. 自动备份当前版本（创建tag）
2. 更新版本号
3. 提交修改到Git
4. 创建新tag
5. 自动打包skill
6. 安装新版本到OpenClaw

## 手动更新流程

### 1. 修改skill文件
编辑以下文件：
- `plush-toy-sample-management/SKILL.md`
- `plush-toy-sample-management/references/valuation-rules.md`

### 2. 更新CHANGELOG.md
在文件顶部添加新版本记录：

```markdown
### v1.0.1 (2026-03-26)
- 修改内容1
- 修改内容2
```

### 3. 提交并创建tag

```bash
cd /Users/redcreen/.openclaw/workspace-order/skills-repo

# 提交修改
git add .
git commit -m "描述修改内容"

# 创建tag
git tag -a v1.0.1 -m "Release v1.0.1"
```

### 4. 打包并安装

```bash
# 打包
cd /Users/redcreen/.openclaw/workspace-order
python3 /usr/local/lib/node_modules/openclaw/skills/skill-creator/scripts/package_skill.py plush-toy-sample-management

# 安装
sudo rm -rf /usr/local/lib/node_modules/openclaw/skills/plush-toy-sample-management
sudo unzip -q plush-toy-sample-management.skill -d /usr/local/lib/node_modules/openclaw/skills/
```

## 文件结构

```
skills-repo/
├── plush-toy-sample-management/
│   ├── SKILL.md                    # 主技能文档
│   ├── references/
│   │   └── valuation-rules.md      # 详细估价规则
│   └── CHANGELOG.md                # 版本历史
├── version-manager.sh              # 版本管理脚本
└── .git/                           # Git仓库
```

## GitHub推送（待完成）

需要在GitHub上创建仓库 `plush-toy-sample-management`，然后推送：

```bash
cd /Users/redcreen/.openclaw/workspace-order/skills-repo
git remote add origin https://github.com/redcreen/plush-toy-sample-management.git
git push -u origin master --tags
```

## 版本历史

### v1.0.0 (2026-03-26)
- 初始版本
- 包含完整的样品估价流程
- 包含材料成本计算规则
- 包含加工成本计算规则
- 包含检查清单和注意事项
