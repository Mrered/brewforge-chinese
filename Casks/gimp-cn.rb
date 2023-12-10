cask "gimp-cn" do
  arch arm: "arm64", intel: "x86_64"

  version "2.10.36"
  sha256 arm:   "1d7c3bb07cce6d51fe6d5cd42653e229ed5ac4e13eea063cd4da8e8e9301eb39",
         intel: "9e6e4f9572d1509cbb7f442b01232428adbfa45cb99f92a6d497b2f25ae9327e"

  url "https://mirrors.ustc.edu.cn/gimp/v#{version.major_minor}/osx/gimp-#{version}-#{arch}.dmg",
      verified: "mirrors.ustc.edu.cn/gimp/"
  name "GIMP development version"
  desc "免费且开源的图像编辑器"
  homepage "https://www.gimp.org/"

  livecheck do
    url "https://www.gimp.org/downloads/"
    regex(%r{href=.*?/gimp[._-]v?(\d+(?:\.\d+)+(-\d)?)[._-]#{arch}\.dmg}i)
  end

  auto_updates true
  conflicts_with cask: ["gimp", "homebrew/cask-versions/gimp-dev"]

  app "GIMP.app"
  shimscript = "#{staged_path}/gimp.wrapper.sh"
  binary shimscript, target: "gimp"

  preflight do
    File.write shimscript, <<~EOS
      #!/bin/sh
      "#{appdir}/GIMP.app/Contents/MacOS/gimp" "$@"
    EOS
  end

  zap trash: [
    "~/Library/Application Support/Gimp",
    "~/Library/Preferences/org.gimp.gimp-#{version.major_minor}:.plist",
    "~/Library/Saved Application State/org.gimp.gimp-#{version.major_minor}:.savedState",
  ]
end
