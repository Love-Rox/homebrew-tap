cask "kichijitsu" do
  version "0.1.16"
  # version と sha256 は kichijitsu 側のリリースワークフロー (.github/workflows/release.yml の
  # Update Homebrew cask) が自動更新する。手で書き換える必要はない (2026-08-07 に自動化)。
  sha256 "675a924adc2578326334ad79c1b3907fe62ee55e0bdf4f96380d49b2a0d7fb54"

  url "https://github.com/Love-Rox/kichijitsu/releases/download/v#{version}/kichijitsu_#{version}_aarch64.dmg"
  name "kichijitsu"
  desc "Local-first calendar client with GitHub integration (Google Calendar counterpart)"
  homepage "https://github.com/Love-Rox/kichijitsu"

  livecheck do
    url :url
    strategy :github_latest
  end

  # アプリ自身が起動中に更新を確認して自動で差し替える。宣言しておくと `brew upgrade` は
  # 重ねて更新しない(更新したいときは `brew upgrade --greedy`)。
  auto_updates true

  # Apple Silicon 専用(容量を減らすため universal をやめた)。
  depends_on arch: :arm64
  depends_on macos: :ventura

  app "kichijitsu.app"

  caveats <<~EOS
    kichijitsu は Developer ID で署名し、Apple の公証を受けています。
    起動中に自動で更新を確認し、新しい版を見つけると、取得してから通知します。
    トレイのメニュー「アップデートを確認」で再起動すると反映されます。

    認証に GitHub CLI を使用します: brew install gh && gh auth login
  EOS
end
