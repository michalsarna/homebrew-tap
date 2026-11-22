cask "lightcreator" do
  arch arm: "arm64", intel: "x86_64"

  version "0.9.9"
  sha256 arm:   "13bd2d41082e5e09747c85bbac900db4bedc9f35d4995a94c8540090474007bc",
         intel: "93a185ebe5e5a815bbb4c81633e926b054d2be5e1ff559f92ffb6baa6be13db8"

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
