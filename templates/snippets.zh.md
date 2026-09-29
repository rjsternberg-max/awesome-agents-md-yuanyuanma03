# 可组合片段库（中文）

> 每个片段是一个独立的 `##` 章节，`amd init` 按需拼装，也可以手动复制进你的 AGENTS.md。
> 章节标题保持英文，便于工具检索；正文为中文。

## Boundaries

### 边界

- ✅ **总是可以做**：阅读任何文件、运行单文件检查、运行单元测试
- ⚠️ **先询问**：安装新依赖、`git push`、删除文件、`chmod`、全量构建、端到端测试
- 🚫 **绝不做**：
  - 绝不提交密钥、Token 或任何敏感凭证
  - 绝不改动 `vendor/`、锁文件或自动生成目录，除非明确要求
  - 绝不删除或跳过失败的测试来"让测试通过"

## Testing

### 测试

- 新功能：先写或更新单元测试，再写实现。
- 修 bug：先写一个能复现 bug 的失败测试，再修复至通过。
- 🚫 未经明确授权，不得删除、注释或跳过失败的测试。
- 快慢分档：单文件测试随时可跑；全量 / 端到端测试仅在明确要求时运行。

## PR Checklist

### PR 检查清单

- 标题格式：`type(scope): 简短描述`
- lint、类型检查、单元测试全部通过后才提交
- 保持小而聚焦的 diff；提交前移除调试日志与多余注释

## File-Scoped Commands

### 单文件命令

优先做单文件检查，而不是全量构建（按技术栈保留可用项）：

- 类型检查：`npx tsc --noEmit path/to/file.ts`
- 格式化：`npx prettier --write path/to/file.ts`
- Lint：`npx eslint --fix path/to/file.ts`
- 单测：`npx vitest run path/to/file.test.ts`
- Python 单测：`uv run pytest path/to/test_file.py -x`

## Example Files

### 示例文件

用仓库内的真实文件当风格教材，比文字描述更有效：

- 这类组件参考 `src/components/DashForm.tsx`
- 这类工具函数参考 `src/lib/format.ts`
- 不要模仿 `src/legacy/Admin.tsx`（旧式写法，等待迁移）

## Completion Criteria

### 完成标准

任务在以下条件全部满足时才算完成：

- 快速检查（类型检查 / lint）通过
- 相关测试通过，没有跳过任何测试
- 无新增警告
- 改动范围与任务要求一致，没有夹带额外修改
