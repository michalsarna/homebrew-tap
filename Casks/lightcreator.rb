cask "lightcreator" do
  arch arm: "arm64", intel: "x86_64"

  version "0.5.1"
  sha256 arm:   "2bb4b957581c1e04aaba9f404deac08d98f607a7a5345e736beb4faa464349c1",
         intel: "5d870fe959b3fc79dcff5a8b18a7339067313579166788c68c5baa2bc85bf59d"

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
