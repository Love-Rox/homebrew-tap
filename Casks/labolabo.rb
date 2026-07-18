cask "labolabo" do
  version "1.2.2"
  sha256 "32e1a513a6fefa9f10e6b718074a63c94925c05d4afb5b88692a10ecd08866d7"

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
