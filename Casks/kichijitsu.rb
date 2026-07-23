cask "kichijitsu" do
  version "0.1.8"
  # version を上げたら、実 DMG の sha256 に差し替える。
  # 取得方法: shasum -a 256 kichijitsu_#{version}_universal.dmg
  sha256 "d3f8bd9f73b02d009bc0c057081a4159c0c22d4c59c6c9ce33c6cfe21191f99e"

  url "https://github.com/Love-Rox/kichijitsu/releases/download/v#{version}/kichijitsu_#{version}_universal.dmg"
  name "kichijitsu"
  desc "Local-first calendar client with GitHub integration (Google Calendar counterpart)"
  homepage "https://github.com/Love-Rox/kichijitsu"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :ventura

  app "kichijitsu.app"

  caveats <<~EOS
    kichijitsu は無署名で配布されています。Gatekeeper が初回起動をブロックするため、
    インストール後に隔離属性を外してください:
      xattr -rd com.apple.quarantine #{appdir}/kichijitsu.app
    (外さない場合は、初回起動がブロックされたら
     システム設定 → プライバシーとセキュリティ → 「このまま開く」)
    ※ Homebrew 6 はダウンロードをサンドボックスで実行するため、
      従来の --no-quarantine 指定では隔離を回避できません。

    認証に GitHub CLI を使用します: brew install gh && gh auth login
  EOS
end
