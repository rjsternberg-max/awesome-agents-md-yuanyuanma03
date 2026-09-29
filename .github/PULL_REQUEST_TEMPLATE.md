## 变更类型

- [ ] 新片段（snippets.zh.md / snippets.en.md 成对修改）
- [ ] 新技术栈模板（templates/stacks/）
- [ ] 新检测规则（tools/amd.sh）
- [ ] 文档 / 翻译
- [ ] 其他

## 自检清单

- [ ] 模板中的命令真实可跑
- [ ] 无"正确的废话"（不可验证的规则）
- [ ] 中英成对同步（如适用）
- [ ] `bash tools/amd.sh check templates/*.md templates/stacks/*.md` 0 FAIL
- [ ] `npx -y markdownlint-cli .` 通过
