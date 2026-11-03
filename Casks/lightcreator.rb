cask "lightcreator" do
  arch arm: "arm64", intel: "x86_64"

  version "0.5.8"
  sha256 arm:   "8cb1b06b15f657230a68ab867f4604856191360dbf2d87237242b99afc78d46e",
         intel: "4fe18f9b5d375a141ab089d02089b9e1ddc38870ff4d66a6897d160c1a467099"

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
