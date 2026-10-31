cask "lightcreator" do
  arch arm: "arm64", intel: "x86_64"

  version "0.5.0"
  sha256 arm:   "ad7cd5a96401780de1ef95e234317bed800fb791f76fdbfe1dd42647eea059a4",
         intel: "013ef6aadb5e0f57b8ebff97ac28d18491852947ea29b2da0259a7acbbd29696"

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
