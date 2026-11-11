cask "millcreator" do
  arch arm: "arm64", intel: "x86_64"

  version "0.8.6"
  sha256 arm:   "a98ef6e1111faff485ed5887b9274caa16983f5bd67b99e32580b8ea81dc498d",
         intel: "29bf3656126171df4e1ff57f93834ef69ed9efc30b039b3a4e23a741a2a913ce"

  url "https://github.com/michalsarna/MillCreator/releases/download/v#{version}/millcreator-v#{version}-macos-#{arch}.dmg"
  name "MillCreator"
  desc "CNC milling software with toolpaths, 3D view and G-code"
  homepage "https://github.com/michalsarna/MillCreator"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :big_sur"

  app "MillCreator.app"

  zap trash: "~/Library/Application Support/baseCreator/apps/millcreator"

  caveats <<~EOS
    MillCreator is not notarized by Apple yet. If macOS refuses to open it the first time,
    right-click the app in Applications and choose Open, or run:
      xattr -dr com.apple.quarantine "#{appdir}/MillCreator.app"
  EOS
end
