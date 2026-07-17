cask "labolabo" do
  version "1.2.0"
  sha256 "8ede3a54327ef9fe7ae6d6db1a010e2f4d7f010be97e06cf5f03b9db52c83416"

  url "https://github.com/Love-Rox/labolabo/releases/download/rs-v#{version}/LaboLabo-#{version}.zip"
  name "LaboLabo"
  desc "Parallel AI coding agents beside live git diffs, one worktree per task"
  homepage "https://labolabo.love-rox.cc/"

  depends_on macos: :sonoma

  app "LaboLabo.app"

  zap trash: [
    "~/Library/Application Support/LaboLabo",
    "~/Library/Caches/com.love-rox.labolabo",
    "~/Library/Preferences/com.love-rox.labolabo.plist",
  ]

  # アドホック署名（Apple の公証なし）のため、初回起動で Gatekeeper がブロックします。
  caveats <<~EOS
    LaboLabo はアドホック署名（notarization なし）で配布されています。
    初回起動でブロックされたら、次のいずれかで許可してください:

      xattr -dr com.apple.quarantine "#{appdir}/LaboLabo.app"

    または Finder で右クリック →「開く」、
    もしくは システム設定 > プライバシーとセキュリティ >「このまま開く」。
  EOS
end
