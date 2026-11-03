cask "pencreator" do
  arch arm: "arm64", intel: "x86_64"

  version "0.5.8"
  sha256 arm:   "916ad2f2a39b4c88121b3b2996d4aae4a1bd4414ae7eee4ca4d321ef6c298eae",
         intel: "008b02662107c711d55ddeac0061f853a6d0b962ab85fee4e78098df7644c96d"

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
