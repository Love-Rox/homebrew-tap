cask "harushion" do
  version "0.1.0"
  sha256 "9de6291713bd96d9552d5ee5dd5eb58b2510d5ff3b081c8d4bb1c6b1a35555fd"

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
