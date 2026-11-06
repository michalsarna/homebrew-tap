cask "lightcreator" do
  arch arm: "arm64", intel: "x86_64"

  version "0.6.2"
  sha256 arm:   "ebd17d84319562cafe84a3fdd38e7fd98e91c5369968bc16dfa716a6c2f26cc1",
         intel: "f9c9e8cdb5dad56b0c527215aba2e170151a9412c1b43ed836287ba458588005"

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
