cask "lightcreator" do
  arch arm: "arm64", intel: "x86_64"

  version "0.5.2"
  sha256 arm:   "dbc7e82d12467b5446451ac3ec0c3eb22d543d8d0d7359233f34af97362e07e9",
         intel: "c339ebcd404cc75e5734db7b6dfd23b51f2c3f1d12ce0f7c0720a8f7ad3d0850"

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
