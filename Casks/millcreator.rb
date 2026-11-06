cask "millcreator" do
  arch arm: "arm64", intel: "x86_64"

  version "0.6.2"
  sha256 arm:   "b228e571cef5fed00fcff27dc708d88180c7f2c6c37ae2f1f6d5924fecaa4d46",
         intel: "46140c054caa678eac5154de96b6938be3b90093f8a2599048442fd9cb11d23d"

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
