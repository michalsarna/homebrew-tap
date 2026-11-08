cask "lightcreator" do
  arch arm: "arm64", intel: "x86_64"

  version "0.8.2"
  sha256 arm:   "79ebdcc7d9468abbec9b51075d783eb36e4dc47ae07c1b01887c187498baaff8",
         intel: "644bba302138d693bddb8c6f4bf3b5f3a2a68b20b83154a2b773fe01967da999"

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
