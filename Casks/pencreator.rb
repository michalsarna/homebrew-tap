cask "pencreator" do
  arch arm: "arm64", intel: "x86_64"

  version "0.8.4"
  sha256 arm:   "f12cce0ef49ebc19d13a365c4b2195bc3090728bb11f08008c162116e2e1fa29",
         intel: "40bba8c6e73c9ded61bfd6eb3f145f91e051c6e5150da8b4bf5d15f9186cc9bf"

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
