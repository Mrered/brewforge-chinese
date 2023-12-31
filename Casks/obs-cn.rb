cask "obs-cn" do
  arch arm: "arm64", intel: "x86_64"

  version "29.1.3"
  sha256 arm:   "ad8586d6af8dd4a0039e6074cf92213340f3d2408cf87e3593fa0822cbc8a73a",
         intel: "0e87051cd5ee50f9efb9c9052d79a3d598761b154308213c40accacc3c9d0895"

  url "https://mirrors.tuna.tsinghua.edu.cn/github-release/obsproject/obs-studio/LatestRelease/obs-studio-#{version}-macos-#{arch}.dmg",
      verified: "mirrors.tuna.tsinghua.edu.cn/"
  name "OBS"
  desc "直播和屏幕录制"
  homepage "https://obsproject.com/zh-cn"

  livecheck do
    url "https://obsproject.com/osx_update/stable/updates_#{arch}.xml"
    strategy :sparkle, &:short_version
  end

  auto_updates true
  conflicts_with cask: ["homebrew/cask-versions/obs-beta", "obs"]
  depends_on macos: ">= :catalina"

   app "OBS.app"
  # shim script (https://github.com/Homebrew/homebrew-cask/issues/18809)
  shimscript = "#{staged_path}/obs.wrapper.sh"
  binary shimscript, target: "obs"

  preflight do
    File.write shimscript, <<~EOS
      #!/bin/bash
      exec '#{appdir}/OBS.app/Contents/MacOS/OBS' "$@"
    EOS
  end

  uninstall delete: "/Library/CoreMediaIO/Plug-Ins/DAL/obs-mac-virtualcam.plugin"

  zap trash: [
    "~/Library/Application Support/obs-studio",
    "~/Library/HTTPStorages/com.obsproject.obs-studio",
    "~/Library/Preferences/com.obsproject.obs-studio.plist",
    "~/Library/Saved Application State/com.obsproject.obs-studio.savedState",
  ]
end
