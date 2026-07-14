cask "harushion" do
  version "0.1.12"
  sha256 "75ae74aa3d4fbb600180a7d5bd99df2e765a18fc014f0ae9739519090d13eee2"

  url "https://github.com/Love-Rox/Harushion/releases/download/v#{version}/Harushion_#{version}_universal.dmg"
  name "Harushion"
  desc "GitHub issue/PR watcher built with Tauri"
  homepage "https://github.com/Love-Rox/Harushion"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :ventura

  app "Harushion.app"

  caveats <<~EOS
    Harushion は無署名で配布されています。Gatekeeper が初回起動をブロックするため、
    インストール後に隔離属性を外してください:
      xattr -rd com.apple.quarantine #{appdir}/Harushion.app
    (外さない場合は、初回起動がブロックされたら
     システム設定 → プライバシーとセキュリティ → 「このまま開く」)
    ※ Homebrew 6 はダウンロードをサンドボックスで実行するため、
      従来の --no-quarantine 指定では隔離を回避できません。

    認証に GitHub CLI を使用します: brew install gh && gh auth login
  EOS
end
