cask "millcreator" do
  arch arm: "arm64", intel: "x86_64"

  version "0.8.0"
  sha256 arm:   "9ac08ea00f9967b1f2dd6e5aba68208a5f7844159e0b8635af0c217590fbdf86",
         intel: "8d42803b571c62a283dfb225a298cad20ca62c8bc142eef24081d1c81e403add"

  url "https://github.com/michalsarna/MillCreator/releases/download/v#{version}/millcreator-v#{version}-macos-#{arch}.dmg"
  name "MillCreator"
  desc "CNC milling software with toolpaths, 3D view and G-code"
  homepage "https://github.com/michalsarna/MillCreator"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :big_sur"

  app "MillCreator.app"

  zap trash: "~/Library/Application Support/baseCreator/apps/millcreator"

  caveats <<~EOS
    MillCreator is not notarized by Apple yet. If macOS refuses to open it the first time,
    right-click the app in Applications and choose Open, or run:
      xattr -dr com.apple.quarantine "#{appdir}/MillCreator.app"
  EOS
end
