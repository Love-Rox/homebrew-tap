cask "harushion" do
  version "0.1.0"
  sha256 :no_check # 初回リリース後に scripts/update-cask.sh が実ハッシュへ更新する

  url "https://github.com/Love-Rox/Harushion/releases/download/v#{version}/Harushion_#{version}_universal.dmg"
  name "Harushion"
  desc "GitHub issue/PR watcher built with Tauri"
  homepage "https://github.com/Love-Rox/Harushion"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :ventura"

  app "Harushion.app"

  caveats <<~EOS
    Harushion は無署名で配布されています。Gatekeeper の隔離を避けるには:
      brew install --cask --no-quarantine love-rox/tap/harushion
    (すでにインストール済みの場合は、初回起動時に右クリック → 開く)

    認証に GitHub CLI を使用します: brew install gh && gh auth login
  EOS
end
