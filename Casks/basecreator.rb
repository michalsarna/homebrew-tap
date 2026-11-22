cask "basecreator" do
  arch arm: "arm64", intel: "x86_64"

  version "2.7.7"
  sha256 arm:   "4d4f22744f32f57a4ee58b2d3c5ea59a4bf0851f570a146243d8c5167c448ec5",
         intel: "a81ecb75efd4f84b1abc48db1802d4ac89e17ddd91ef4fa2c4b0dfcf5ad2cff0"

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
