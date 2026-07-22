class PixivCli < Formula
  desc "Pixiv command-line client and MCP server"
  homepage "https://github.com/FlanChanXwO/pixiv-cli"
  version "0.5.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/FlanChanXwO/pixiv-cli/releases/download/v0.5.0/pixiv-cli_0.5.0_darwin_arm64.tar.gz"
      sha256 "28cccc4f4d5948f9fe2b1d1b1cf68fd86a8459e3d559669e58633ee92c7259ab"
    else
      url "https://github.com/FlanChanXwO/pixiv-cli/releases/download/v0.5.0/pixiv-cli_0.5.0_darwin_amd64.tar.gz"
      sha256 "ecdc6be49dbd37f1b3cdf17615fd984829936c29799ac205a76ab554d37934ad"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/FlanChanXwO/pixiv-cli/releases/download/v0.5.0/pixiv-cli_0.5.0_linux_arm64.tar.gz"
      sha256 "2158deadd264b3b00ec947bca3223397023be0329fcaceb11bb0f01790f3f87c"
    else
      url "https://github.com/FlanChanXwO/pixiv-cli/releases/download/v0.5.0/pixiv-cli_0.5.0_linux_amd64.tar.gz"
      sha256 "b9a674ab7ce97db6c55d35a5d633cb7e6cee22c592420ca8aa93932f310db45c"
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
