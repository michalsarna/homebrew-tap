cask "lightcreator" do
  arch arm: "arm64", intel: "x86_64"

  version "0.9.2"
  sha256 arm:   "375b3f06cd4ad3ba2caa567c024a45d3f425b566dfac7d9a24d45a42240c8983",
         intel: "f318b97e62a1a67cc8ac34ff3fa5b75827a31faa82bea1d1ce205ea97cd3c92d"

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
