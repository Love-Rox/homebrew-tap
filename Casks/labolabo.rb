cask "labolabo" do
  version "0.5.1"
  sha256 "144355d94ab6647a11ad51f5537d0378341aa79040be94a66bf3e027a65b8b33"

  url "https://github.com/Love-Rox/labolabo/releases/download/v#{version}/LaboLabo-#{version}.zip"
  name "LaboLabo"
  desc "Run parallel AI coding agents, one git worktree per session, beside live git diffs"
  homepage "https://github.com/Love-Rox/labolabo"

  depends_on macos: :sonoma

  app "LaboLabo.app"

  # アドホック署名（Apple の公証なし）のため、初回起動で Gatekeeper がブロックします。
  caveats <<~EOS
    LaboLabo はアドホック署名（notarization なし）で配布されています。
    初回起動でブロックされたら、次のいずれかで許可してください:

      xattr -dr com.apple.quarantine "#{appdir}/LaboLabo.app"

    または Finder で右クリック →「開く」、
    もしくは システム設定 > プライバシーとセキュリティ >「このまま開く」。
  EOS

  zap trash: [
    "~/Library/Application Support/LaboLabo",
    "~/Library/Preferences/com.love-rox.labolabo.plist",
    "~/Library/Caches/com.love-rox.labolabo",
  ]
end
