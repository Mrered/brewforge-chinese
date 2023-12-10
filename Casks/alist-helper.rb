cask "alist-helper" do
  version "0.1.3"
  sha256 "5c77ef780fa9254ec79527be8b8b7d0da793001c0de05e6d707fdf2b2e930012"

  url "https://github.com/Xmarmalade/alisthelper/releases/download/v#{version}/AlistHelper_v#{version}_macos.dmg"
  name "Alist Helper"
  desc "基于 AList CLI 的图形界面应用"
  homepage "https://github.com/Xmarmalade/alisthelper/blob/master/README_zh-Hans.md"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on cask: "alistcli"

  app "alisthelper.app"

  zap trash: [
    "~/Library/Preferences/dev.xmarmalade.alisthelper.alisthelper.plist",
  ]
end
