cask "lightcreator" do
  arch arm: "arm64", intel: "x86_64"

  version "0.9.5"
  sha256 arm:   "dc0c947761f733baab67db5bdec7b12eb61bf945674df1cfaaf1234d03125b11",
         intel: "d5bc02e30b006562483b18521b8fa89cd323eaf78fd6af35fae134ef8c503ea0"

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
