cask "kicad-cn" do
  version "7.0.9"
  sha256 "0e626521850594596d30711967216203e85343e0ed59f552336975fef6caa7dc"

  url "https://mirrors.tuna.tsinghua.edu.cn/kicad/osx/stable/kicad-unified-universal-#{version}.dmg",
      verified: "mirrors.tuna.tsinghua.edu.cn/kicad/"
  name "KiCad"
  desc "EDA 套件"
  homepage "https://kicad.org/"

  livecheck do
    url "https://www.kicad.org/download/macos/"
    regex(/(\d+(?:\.\d+)+)/i)
  end

  depends_on macos: ">= :big_sur"

  suite "KiCad"
  binary "KiCad/KiCad.app/Contents/MacOS/dxf2idf"
  binary "KiCad/KiCad.app/Contents/MacOS/idf2vrml"
  binary "KiCad/KiCad.app/Contents/MacOS/idfcyl"
  binary "KiCad/KiCad.app/Contents/MacOS/idfrect"
  binary "KiCad/KiCad.app/Contents/MacOS/kicad-cli"
  artifact "demos", target: "/Library/Application Support/kicad/demos"

  zap trash: [
    "/Library/Application Support/kicad",
    "~/Library/Application Support/kicad",
    "~/Library/Preferences/kicad",
    "~/Library/Preferences/org.kicad-pcb.*",
    "~/Library/Saved Application State/org.kicad-pcb.*",
  ]
end
