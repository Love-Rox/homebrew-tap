cask "kichijitsu" do
  version "0.1.0"
  sha256 "2f47ff27bd782ab683a251d3e3dea0179ee5a11856022137dbedb66e9b3b4a95"

  url "https://github.com/Love-Rox/kichijitsu/releases/download/v#{version}/kichijitsu_#{version}_universal.dmg"
  name "kichijitsu"
  desc "Local-first Google Calendar client built with Tauri"
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
