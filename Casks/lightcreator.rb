cask "lightcreator" do
  arch arm: "arm64", intel: "x86_64"

  version "0.9.8"
  sha256 arm:   "6ba00ec9ad6877568996f826cda922c98abe114d79a0fea13b59e6743941e32a",
         intel: "7e5daacf5b771870b1ad2c6899b88f93544301729d364c42818828986b67b994"

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
