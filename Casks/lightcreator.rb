cask "lightcreator" do
  arch arm: "arm64", intel: "x86_64"

  version "0.5.4"
  sha256 arm:   "811b07160e73138728d2c45d48c286d51371ba6d14023943548b0844141d36bf",
         intel: "0173ee2b03310780730ce3e873eddf47fa054fb729c10863f2e9063c83cd943d"

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
