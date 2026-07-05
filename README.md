# Love-Rox Homebrew Tap

## LaboLabo

複数の AI コーディングエージェント（Claude Code / Codex / Gemini …）を
**1 セッション = 1 git worktree** で並列に走らせ、ライブな Git 状態とファイル差分を
端末の真横で確認する macOS ネイティブアプリ。

### インストール

```sh
brew tap love-rox/tap
brew trust love-rox/tap          # 第三者 tap の信頼（Homebrew の要件）
brew install --cask labolabo
```

### 更新

```sh
brew upgrade --cask labolabo
```

アプリ内でも新バージョンを通知します（設定 > 一般）。

### 注意（署名について）

アドホック署名（Apple の公証なし・無料配布）のため、初回起動で macOS の
Gatekeeper がブロックします。インストール時に表示される `caveats` の手順で許可してください:

```sh
xattr -dr com.apple.quarantine "/Applications/LaboLabo.app"
```

または Finder で右クリック →「開く」、もしくは システム設定 > プライバシーとセキュリティ >「このまま開く」。
