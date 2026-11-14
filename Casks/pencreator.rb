cask "pencreator" do
  arch arm: "arm64", intel: "x86_64"

  version "0.9.0"
  sha256 arm:   "0182607da09c4be89d3ecc9cc6b76208fb1ee3c9f7a387dbf66f265603949490",
         intel: "10b66eeefc30db0df2f4bc6f65111f69ab06cd0bbb779976719104dc87a236ad"

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
