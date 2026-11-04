cask "lightcreator" do
  arch arm: "arm64", intel: "x86_64"

  version "0.5.9"
  sha256 arm:   "b5325d723bc46cf63d4c350b501a6a658bdffe663221ca251f75596ecf423803",
         intel: "5a46597d72ee767a7dec3eb68ef40eacba0d388d21a1619725f789349a702efa"

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
