cask "basecreator" do
  arch arm: "arm64", intel: "x86_64"

  version "2.7.0"
  sha256 arm:   "d3ee03ec50b40963d7ccb49ee077dcab0648a7263768a80c640649fdfbdaacd1",
         intel: "9c36d3c3b03187eb2bfb3bed1cd4de0a2e92db6595e3d9aa8e6872d580653f1d"

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
