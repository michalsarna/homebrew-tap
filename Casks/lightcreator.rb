cask "lightcreator" do
  arch arm: "arm64", intel: "x86_64"

  version "0.8.0"
  sha256 arm:   "4c06a2150f5dd4412c2baa549b446eb0c3c93777dce23cd11e5a2741a68888f5",
         intel: "26ec49eb7aa57fb9053950c05f37e5850bdb1326def207ad6aa24791b05e0d43"

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
