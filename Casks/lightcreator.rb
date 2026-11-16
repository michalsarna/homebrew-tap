cask "lightcreator" do
  arch arm: "arm64", intel: "x86_64"

  version "0.9.6"
  sha256 arm:   "bd14d119ef7bff601da4aa54c83e1d10285e3178d235b014d8bc836f8deb5618",
         intel: "777c2ab476a2a0a2e5d8deeefc59c28d9c6c51b593bc42ee7b78e4983293ac8b"

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
