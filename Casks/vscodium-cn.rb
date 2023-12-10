cask "vscodium-cn" do
  arch arm: "arm64", intel: "x64"

  version "1.84.2.23319"
  sha256 arm:   "6c5d8e2de9ef01285da949b413d51a57d352f904d7ca11f6a3033355f2830bb2",
         intel: "8e298715d915cafe4c564332b97efe509ca6d201d6c8badc92a9e9ff18a8ce52"

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
