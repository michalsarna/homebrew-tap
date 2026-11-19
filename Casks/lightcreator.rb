cask "lightcreator" do
  arch arm: "arm64", intel: "x86_64"

  version "0.9.7"
  sha256 arm:   "975158f48eb0e1976ff57d3c248cd75e3f5eb16e0071d8377ba21f1e28dba37e",
         intel: "3445a6f83bcb582cfda7907909808874d11da4476c1fc949fad1c73d05fc64c8"

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
