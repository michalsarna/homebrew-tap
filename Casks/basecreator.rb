cask "basecreator" do
  arch arm: "arm64", intel: "x86_64"

  version "2.7.13"
  sha256 arm:   "9f88e01f75da27d5db5a6255ffa79d185debc08ab0beae077b38b69bbcbd8685",
         intel: "017533aa3dc1db7224c2a755d6050dd7ea10198f3df7974dc8d44b050044c91d"

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
