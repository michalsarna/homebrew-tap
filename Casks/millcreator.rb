cask "millcreator" do
  arch arm: "arm64", intel: "x86_64"

  version "0.6.1"
  sha256 arm:   "871a5cf8ea8c9bc79de929bd00286b9623a6fcdd6f428f3e822c1d9faa4483ca",
         intel: "799a446fcf31f884f2f9bdbba6008784cc669a98a5836bb921523ef1bc082c97"

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
