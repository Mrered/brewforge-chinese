cask "clash-verge-rev" do
  arch arm: "aarch64", intel: "x64"

  version "1.4.4"
  sha256 arm:   "5a0cab6d537ddd555b77ebaddd5db4fc9c0be7090a1e1673342d117a295067c5",
         intel: "a76024396f5c7fa58690e5f9281a881c571ebdad8f6e928005357b1335bd719e"

  url "https://github.com/wonfen/clash-verge-rev/releases/download/v#{version}/Clash.Verge_#{version}_#{arch}.dmg"
  name "Clash Verge Rev"
  desc "Clash Verge 的接盘项目"
  homepage "https://github.com/wonfen/clash-verge-rev"

  livecheck do
    url :url
    strategy :github_latest
  end

  conflicts_with cask: "clash-verge"

  app "Clash Verge.app"

  preflight do
    system_command "xattr",
                   args: ["-cr", "#{staged_path}/Clash Verge.app"]
  end

  zap trash: [
    "~/.config/clash-verge",
    "~/Library/Caches/msedge_crashpad_handler",
    "~/Library/Preferences/moe.elaina.clash.verge.plist",
    "~/Library/Saved Application State/moe.elaina.clash.verge.savedState",
  ]
end
