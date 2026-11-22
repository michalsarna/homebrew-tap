cask "pencreator" do
  arch arm: "arm64", intel: "x86_64"

  version "0.9.9"
  sha256 arm:   "7be12839cd4aa8c3278c5d336c1c02174e1da0b3b690f00b4ee60fee1704e085",
         intel: "2abd0a481b8ef28d30a9f0fdc0966c494dd4e9681926a5ab58ae677e3ca16262"

  url "https://github.com/michalsarna/PenCreator/releases/download/v#{version}/pencreator-v#{version}-macos-#{arch}.dmg"
  name "PenCreator"
  desc "Pen plotter software with pens as layers, plot preview and G-code"
  homepage "https://github.com/michalsarna/PenCreator"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :big_sur"

  app "PenCreator.app"

  zap trash: "~/Library/Application Support/baseCreator/apps/pencreator"

  caveats <<~EOS
    PenCreator is not notarized by Apple yet. If macOS refuses to open it the first time,
    right-click the app in Applications and choose Open, or run:
      xattr -dr com.apple.quarantine "#{appdir}/PenCreator.app"
  EOS
end
