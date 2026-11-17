cask "ochto" do
  version "1.2.0"
  sha256 "5555bb099758e0009c017a89b92ea5a2f4479dfb945ff0ef0032ef71f38b0afa"

  url "https://github.com/pportella23/ochto-releases/releases/download/v#{version}/Ochto-arm64.dmg"
  name "Ochto"
  desc "Run several Claude Code accounts side by side (paid, 7-day trial)"
  homepage "https://pportella23.github.io/ochto-releases/"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on arch: :arm64
  depends_on macos: :ventura

  app "Ochto.app"

  zap trash: [
    "~/Library/Application Support/Ochto",
    "~/Library/Caches/ochto-updater",
    "~/Library/Preferences/io.github.pportella23.ochto.plist",
    "~/Library/Saved Application State/io.github.pportella23.ochto.savedState",
  ]

  caveats <<~EOS
    Ochto runs Claude Code, which must be installed separately:
      https://code.claude.com/docs/en/setup
  EOS
end
