cask "lightcreator" do
  arch arm: "arm64", intel: "x86_64"

  version "0.7.0"
  sha256 arm:   "7dd13c873a60125265982ecac1dca1496376f001af4b8ed394c92ec78ec7cba1",
         intel: "085a4b8fd83636d561e600f49a74ca0ae923e78de68d461bdbaf737cb79eccdc"

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
