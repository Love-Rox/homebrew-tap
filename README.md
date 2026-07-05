# Love-Rox Homebrew Tap

## LaboLabo

複数の AI コーディングエージェント（Claude Code / Codex / Gemini …）を
**1 セッション = 1 git worktree** で並列に走らせ、ライブな Git 状態とファイル差分を
端末の真横で確認する macOS ネイティブアプリ。

### インストール

```sh
brew install --cask Love-Rox/tap/labolabo
```

### 更新

```sh
brew upgrade --cask labolabo
```

アプリ内でも新バージョンを通知します（設定 > 一般 でアップデート確認）。

### 注意（署名について）

アドホック署名（Apple の公証なし・無料配布）のため、初回起動で macOS の
Gatekeeper がブロックします。Cask の `caveats`（インストール時に表示）の手順で
許可してください。
