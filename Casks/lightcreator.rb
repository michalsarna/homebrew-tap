cask "lightcreator" do
  arch arm: "arm64", intel: "x86_64"

  version "0.5.6"
  sha256 arm:   "27c508844b8a51513436b403833bf5612232f8a5ee2c87de8e88f4d51b7961eb",
         intel: "75373072a2ff3d07423a958187f09930c612c3e30b5623a1b5557599eae85b4e"

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
