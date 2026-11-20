cask "ochto" do
  version "1.4.1"
  sha256 "2581ea5fa0e2657dfc36f175011d25a5933d6bafe1b78e124837ff14455d892a"

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
