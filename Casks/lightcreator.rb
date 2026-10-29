cask "lightcreator" do
  arch arm: "arm64", intel: "x86_64"

  version "0.4.0"
  sha256 arm:   "75328a5e72761a1b5598b022225e64f7207e26236950e95afa7e2ef5daf8d2c4",
         intel: "666deb94affff84b51895d1ca341ae79792ff575127ab8460750ac49e6278736"

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
