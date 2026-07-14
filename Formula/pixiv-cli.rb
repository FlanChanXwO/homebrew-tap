class PixivCli < Formula
  desc "Pixiv command-line client and MCP server"
  homepage "https://github.com/FlanChanXwO/pixiv-cli"
  version "0.2.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/FlanChanXwO/pixiv-cli/releases/download/v0.2.0/pixiv-cli_0.2.0_darwin_arm64.tar.gz"
      sha256 "c6d155e0d40f82c600171c364b80ab7d3f43c76e5ab66dbc91aeffd2b3e8d432"
    else
      url "https://github.com/FlanChanXwO/pixiv-cli/releases/download/v0.2.0/pixiv-cli_0.2.0_darwin_amd64.tar.gz"
      sha256 "09abb3b63bebd9a913ae3451daf3ef7bc445353cac2e8baf543d216943fce490"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/FlanChanXwO/pixiv-cli/releases/download/v0.2.0/pixiv-cli_0.2.0_linux_arm64.tar.gz"
      sha256 "f6a5e9a603a92ba1481013636aa4061fb9057a3172425d00fb0282b96cf859e5"
    else
      url "https://github.com/FlanChanXwO/pixiv-cli/releases/download/v0.2.0/pixiv-cli_0.2.0_linux_amd64.tar.gz"
      sha256 "4f6c9ba6642f226b2a8201254c0b96aab28b7fae2a31772367f635cd4f87a4d7"
    end
  end

  conflicts_with "pixiv-cli-beta", because: "both install the pixiv command"

  def install
    bin.install "pixiv"
  end

  test do
    version_info = JSON.parse(shell_output("#{bin}/pixiv version --json"))
    assert_equal "v#{version}", version_info["version"]
  end
end
