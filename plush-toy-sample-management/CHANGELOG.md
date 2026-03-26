# Plush Toy Sample Management Skill

## 版本历史

### v1.0.0 (2026-03-26)
- 初始版本
- 包含完整的样品估价流程
- 包含材料成本计算规则
- 包含加工成本计算规则
- 包含检查清单和注意事项

## 版本管理规则

### 版本号格式
- 主版本号.次版本号.修订号
- 例如：v1.0.0

### 版本更新规则
- **小版本+1**：功能更新、规则调整
- **次版本+1**：重大功能新增
- **主版本+1**：架构重构或不兼容变更

### 更新流程
1. 备份当前版本（创建tag）
2. 修改skill文件
3. 更新CHANGELOG.md
4. 提交到GitHub
5. 创建新tag
6. 重新打包并安装

## 文件结构
```
plush-toy-sample-management/
├── SKILL.md                          # 主技能文档
├── references/
│   └── valuation-rules.md            # 详细估价规则
└── CHANGELOG.md                      # 版本历史（本文件）
```

## 安装位置
`/usr/local/lib/node_modules/openclaw/skills/plush-toy-sample-management/`

## 打包命令
```bash
python3 /usr/local/lib/node_modules/openclaw/skills/skill-creator/scripts/package_skill.py plush-toy-sample-management
```
