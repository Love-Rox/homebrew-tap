cask "labolabo-rs" do
  version "1.0.0"
  sha256 "a3d6bef56992b5f9a0f1220aebce8c7b844e027d9db76dd1d3b0d5cbb8f34906"

  url "https://github.com/Love-Rox/labolabo/releases/download/rs-v#{version}/LaboLabo-rs-#{version}.zip"
  name "LaboLabo-rs"
  desc "Cross-platform (Rust) LaboLabo: parallel AI coding agents beside live git diffs"
  homepage "https://labolabo.love-rox.cc/"

  depends_on macos: :sonoma

  app "LaboLabo-rs.app"

  zap trash: [
    "~/Library/Application Support/LaboLabo-rs",
    "~/Library/Caches/com.love-rox.labolabo-rs",
    "~/Library/Preferences/com.love-rox.labolabo-rs.plist",
  ]

  # アドホック署名（Apple の公証なし）のため、初回起動で Gatekeeper がブロックします。
  caveats <<~EOS
    LaboLabo-rs はアドホック署名（notarization なし）で配布されています。
    初回起動でブロックされたら、次のいずれかで許可してください:

      xattr -dr com.apple.quarantine "#{appdir}/LaboLabo-rs.app"

    または Finder で右クリック →「開く」、
    もしくは システム設定 > プライバシーとセキュリティ >「このまま開く」。

    Swift 版（cask "labolabo"）とは独立してインストールされます。
  EOS
end
