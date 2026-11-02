cask "lightcreator" do
  arch arm: "arm64", intel: "x86_64"

  version "0.5.5"
  sha256 arm:   "7b56f4ec1c1f8098d745028d1ca24f9737e636c5359e6a79360dabcdab86c786",
         intel: "9155470d29da04aaa358bbe668592b3bf8b9ba84b2afc026bc52112875db3347"

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
