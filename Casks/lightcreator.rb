cask "lightcreator" do
  arch arm: "arm64", intel: "x86_64"

  version "1.1.1"
  sha256 arm:   "079634b1b21b8b6c39fd361dad3de8d6e06bd1768e1d8821ca1f7041573ccb9f",
         intel: "5c2035326ba5c081ee4076f1c9032daabdcd96d89a9db80b0460af5a2a6b4730"

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
