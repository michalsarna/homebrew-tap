cask "lightcreator" do
  arch arm: "arm64", intel: "x86_64"

  version "0.3.9"
  sha256 arm:   "ca18e9183669e0623db8e49acc5ebf732dc5be79ed536836c9282972d3bb4527",
         intel: "c1e42632b93c6f5c5879e8408cd626dc8a08a9de768506c92b25d2eee2789756"

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
