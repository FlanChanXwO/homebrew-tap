class PixivCli < Formula
  desc "Pixiv command-line client and MCP server"
  homepage "https://github.com/FlanChanXwO/pixiv-cli"
  version "0.6.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/FlanChanXwO/pixiv-cli/releases/download/v0.6.0/pixiv-cli_0.6.0_darwin_arm64.tar.gz"
      sha256 "98c28666908cfe814feca06eb0ae99c41dfe267a5f2e787a3dfc9248bf46c549"
    else
      url "https://github.com/FlanChanXwO/pixiv-cli/releases/download/v0.6.0/pixiv-cli_0.6.0_darwin_amd64.tar.gz"
      sha256 "e54863ef28e1819e0bb94880ad5e68d49ce4c04490f6475774e48fa23b965077"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/FlanChanXwO/pixiv-cli/releases/download/v0.6.0/pixiv-cli_0.6.0_linux_arm64.tar.gz"
      sha256 "6d5895f137e56b1a8ca184e4ae2faf47a973fc4eafa5719b5b4e1c5632af751d"
    else
      url "https://github.com/FlanChanXwO/pixiv-cli/releases/download/v0.6.0/pixiv-cli_0.6.0_linux_amd64.tar.gz"
      sha256 "a99ad5d08855c7bd2d560bcc60a5327cd3bf94a1301b59cd6207c2e2cec7c7a2"
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
