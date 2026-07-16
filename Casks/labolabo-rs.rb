cask "labolabo-rs" do
  version "1.0.0"
  sha256 "a3d6bef56992b5f9a0f1220aebce8c7b844e027d9db76dd1d3b0d5cbb8f34906"

  url "https://github.com/Love-Rox/labolabo/releases/download/rs-v#{version}/LaboLabo-rs-#{version}.zip"
  name "LaboLabo-rs"
  desc "Renamed: install love-rox/tap/labolabo instead"
  homepage "https://labolabo.love-rox.cc"

  deprecate! date: "2026-07-17", because: :discontinued

  depends_on macos: :sonoma

  app "LaboLabo-rs.app"

  caveats <<~EOS
    LaboLabo-rs は「LaboLabo」に改名されました。今後の更新はこちらへ:

      brew uninstall labolabo-rs
      brew install love-rox/tap/labolabo
  EOS

  zap trash: [
    "~/Library/Application Support/LaboLabo-rs",
    "~/Library/Caches/com.love-rox.labolabo-rs",
    "~/Library/Preferences/com.love-rox.labolabo-rs.plist",
  ]
end
