cask "lightcreator" do
  arch arm: "arm64", intel: "x86_64"

  version "0.9.0"
  sha256 arm:   "3d49b253320086e5bbe64667a9b2657f395aebd45a4dd08c7f5854542e8e8012",
         intel: "a276d46435b2ac9871e4cc7be619423c665dc92af74f39f1b42f4dfd9fbf895e"

  url "https://github.com/michalsarna/LightCreator/releases/download/v#{version}/lightcreator-v#{version}-macos-#{arch}.dmg"
  name "LightCreator"
  desc "Laser engraver and cutter design and control software"
  homepage "https://github.com/michalsarna/LightCreator"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :big_sur"

  app "LightCreator.app"

  zap trash: "~/Library/Application Support/baseCreator/apps/lightcreator"

  caveats <<~EOS
    LightCreator is not notarized by Apple yet. If macOS refuses to open it the first time,
    right-click the app in Applications and choose Open, or run:
      xattr -dr com.apple.quarantine "#{appdir}/LightCreator.app"
  EOS
end
