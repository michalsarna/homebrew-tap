cask "basecreator" do
  arch arm: "arm64", intel: "x86_64"

  version "1.61.0"
  sha256 arm:   "3c23c6e0ea9257feb1b34c5768dd071072eac15cc9960db0f1659bda9d51ba61",
         intel: "035d15ac5cf83bb4eb430022c5df74aca6ddb05ac954f0a78e666e9654060428"

  url "https://github.com/michalsarna/baseCreator/releases/download/v#{version}/basecreator-v#{version}-macos-#{arch}.dmg"
  name "BaseCreator"
  desc "Drawing program that writes the project files of the Creator apps"
  homepage "https://github.com/michalsarna/baseCreator"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :big_sur"

  app "BaseCreator.app"

  zap trash: "~/Library/Application Support/baseCreator/apps/basecreator"

  caveats <<~EOS
    BaseCreator is not notarized by Apple yet. If macOS refuses to open it the first time,
    right-click the app in Applications and choose Open, or run:
      xattr -dr com.apple.quarantine "#{appdir}/BaseCreator.app"
  EOS
end
