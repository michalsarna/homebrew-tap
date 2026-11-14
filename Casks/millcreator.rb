cask "millcreator" do
  arch arm: "arm64", intel: "x86_64"

  version "0.9.2"
  sha256 arm:   "fa38617c9047e1bb3a3022cbd4ac5e3e2c1943cd3c2ad7ccbc992927f2ffde03",
         intel: "9fd007697ab31aeb7edfef7fdfe23c13f87fa376d547fbd7c3cfaa6330a19e03"

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
