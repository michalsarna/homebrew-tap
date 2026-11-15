cask "lightcreator" do
  arch arm: "arm64", intel: "x86_64"

  version "0.9.4"
  sha256 arm:   "bdb3bf28998f96226c9563f83cefaae6d8cd56f9e4e68177510732dfd38dd505",
         intel: "861056781c312f2f52cad43b0d03afbc6ef0b8535c9bd10041a95fe5d8ad01af"

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
