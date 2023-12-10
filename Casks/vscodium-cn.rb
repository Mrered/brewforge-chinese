cask "vscodium-cn" do
  arch arm: "arm64", intel: "x64"

  version "1.85.0.23343"
  sha256 arm:   "0a7b685ee415a263b6f6f0fa019ec7d18b24fa8c0a6302ba25f0332cf93763ab",
         intel: "cf775cf75bb44048e3375607a369fff692033f7f16b810a09408e2e22617d819"

  url "https://mirrors.tuna.tsinghua.edu.cn/github-release/VSCodium/vscodium/LatestRelease/VSCodium.#{arch}.#{version}.dmg",
      verified: "mirrors.tuna.tsinghua.edu.cn/"
  name "VSCodium"
  desc "没有微软品牌，跟踪和许可的 VS Code 二进制分发文件"
  homepage "https://github.com/VSCodium/vscodium"

  auto_updates true
  conflicts_with cask: "vscodium"

  app "VSCodium.app"
  binary "#{appdir}/VSCodium.app/Contents/Resources/app/bin/codium"

  zap trash: [
    "~/.vscode-oss",
    "~/Library/Application Support/com.apple.sharedfilelist/com.apple.LSSharedFileList.ApplicationRecentDocuments/com.visualstudio.code.oss.sfl*",
    "~/Library/Application Support/VSCodium",
    "~/Library/Logs/VSCodium",
    "~/Library/Preferences/com.visualstudio.code.oss.helper.plist",
    "~/Library/Preferences/com.visualstudio.code.oss.plist",
    "~/Library/Saved Application State/com.visualstudio.code.oss.savedState",
  ]
end
