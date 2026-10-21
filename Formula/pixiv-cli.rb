class PixivCli < Formula
  desc "Pixiv command-line client and MCP server"
  homepage "https://github.com/FlanChanXwO/pixiv-cli"
  version "1.2.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/FlanChanXwO/pixiv-cli/releases/download/v1.2.0/pixiv-cli_1.2.0_darwin_arm64.tar.gz"
      sha256 "07bbdf805a772ff533324f7958a033e90ab67ffebde2a0cfcce612e31eb00a1f"
    else
      url "https://github.com/FlanChanXwO/pixiv-cli/releases/download/v1.2.0/pixiv-cli_1.2.0_darwin_amd64.tar.gz"
      sha256 "5cb70271c7bc13c8ec17b7ac4898fe569521f313fdcc788082e1e6481bc6c551"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/FlanChanXwO/pixiv-cli/releases/download/v1.2.0/pixiv-cli_1.2.0_linux_arm64.tar.gz"
      sha256 "27436a1c902e531f88943dcb04256fe29028033c5425d3e44b9b5717956a6ae6"
    else
      url "https://github.com/FlanChanXwO/pixiv-cli/releases/download/v1.2.0/pixiv-cli_1.2.0_linux_amd64.tar.gz"
      sha256 "46f8706486f7917757a482f9f44a099813f9984d717b634e697bdca7b3bc9294"
    end
  end

  def install
    bin.install "pixiv"
  end

  def post_install
    # The hidden command reports integration failures without invalidating the
    # verified Homebrew installation; a normal browser login retries it.
    system bin/"pixiv", "auth", "_install-handler"
  end

  test do
    assert_equal "pixiv v#{version}\n", shell_output("#{bin}/pixiv --version")
  end
end
