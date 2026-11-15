cask "lightcreator" do
  arch arm: "arm64", intel: "x86_64"

  version "0.9.3"
  sha256 arm:   "c219286225f1517866a39e7c85c80d926ad0bb5ce352110378310de965be898f",
         intel: "323e42bb9d5c5bb5a4480cdca62476a5e0fd475c3b5c265387e1c5ef751b856a"

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
