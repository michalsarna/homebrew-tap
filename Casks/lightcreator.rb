cask "lightcreator" do
  arch arm: "arm64", intel: "x86_64"

  version "0.8.6"
  sha256 arm:   "328e10ab43fb29e24e775334d552534762b0a43072b6414958d33669a3b33031",
         intel: "e36eccdd3a2ccf4d6979ade5f9c4d3eab2bbed1fdfec42f2fe91e5f891b910ac"

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
