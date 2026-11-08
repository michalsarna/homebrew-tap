cask "lightcreator" do
  arch arm: "arm64", intel: "x86_64"

  version "0.8.1"
  sha256 arm:   "2e5e4b97988293730ddf4f2db79ed98887759e3a83b48c59392e6e90c9ce97ab",
         intel: "3eda093c3d44ad8cf0a32c654ec28725ee2dc3846214a855a49cf862b654e113"

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
