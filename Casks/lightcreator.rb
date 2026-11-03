cask "lightcreator" do
  arch arm: "arm64", intel: "x86_64"

  version "0.5.7"
  sha256 arm:   "33a3f31db209974a5b3920d5764eeadb321a9bdad3cf387582a20a07f38aadd6",
         intel: "1948f699d086979a2b5dbc0450ee7c65fe26519c1b8145ed82b6bb269b2a9f80"

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
