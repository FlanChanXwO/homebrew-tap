class PixivCli < Formula
  desc "Pixiv command-line client and MCP server"
  homepage "https://github.com/FlanChanXwO/pixiv-cli"
  version "0.7.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/FlanChanXwO/pixiv-cli/releases/download/v0.7.0/pixiv-cli_0.7.0_darwin_arm64.tar.gz"
      sha256 "5ecfaa8bb04b1699c950ce2e63060e402460737a0b70a9f1e432df07d8ef4f03"
    else
      url "https://github.com/FlanChanXwO/pixiv-cli/releases/download/v0.7.0/pixiv-cli_0.7.0_darwin_amd64.tar.gz"
      sha256 "ace271df5580bad24d749502ed85dc66021cb0e339170636dcbff837dc60db89"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/FlanChanXwO/pixiv-cli/releases/download/v0.7.0/pixiv-cli_0.7.0_linux_arm64.tar.gz"
      sha256 "c6e6ef130320ede221733f0667594d13aaaccd12be7dfe6ffe5176d144cef1e9"
    else
      url "https://github.com/FlanChanXwO/pixiv-cli/releases/download/v0.7.0/pixiv-cli_0.7.0_linux_amd64.tar.gz"
      sha256 "45025a14a6c8d95021b104fb9f43d0ff470ada7eb4ec580b0c24da45aa357a2c"
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
