cask "kichijitsu" do
  version "0.1.7"
  # version を上げたら、実 DMG の sha256 に差し替える。
  # 取得方法: shasum -a 256 kichijitsu_#{version}_universal.dmg
  sha256 "0251d06e990025e6767fb829c6f403a53d6c5c4514141a548701e18f997ec300"

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
