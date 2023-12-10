cask "clash-verge-rev" do
  arch arm: "aarch64", intel: "x64"

  version "1.4.4"
  sha256 arm:   "06599bba9206c50d0a1e00e60e03d55a48e6a7ba6645c62d84bbcdba6bbb8526",
         intel: "e4875eddee18a26a8aa3a634f49cfeb81a5ee146cf590f415733cb603ee91b2e"

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
