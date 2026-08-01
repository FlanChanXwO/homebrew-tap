class PixivCli < Formula
  desc "Pixiv command-line client and MCP server"
  homepage "https://github.com/FlanChanXwO/pixiv-cli"
  version "0.10.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/FlanChanXwO/pixiv-cli/releases/download/v0.10.0/pixiv-cli_0.10.0_darwin_arm64.tar.gz"
      sha256 "b381e2efef9f2d4ebdc076fbdf3b7cbcd2fb1d8216b87ef8b8992151d7eeab0d"
    else
      url "https://github.com/FlanChanXwO/pixiv-cli/releases/download/v0.10.0/pixiv-cli_0.10.0_darwin_amd64.tar.gz"
      sha256 "e93adafb70dea5bf83f751cdc9f659bdc0a174bbcd2d7c172a5811045568cc1a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/FlanChanXwO/pixiv-cli/releases/download/v0.10.0/pixiv-cli_0.10.0_linux_arm64.tar.gz"
      sha256 "d880cc17932d9a864d3f23c51609d04ba7de621ea7f4e7a0d3ac764bb22151af"
    else
      url "https://github.com/FlanChanXwO/pixiv-cli/releases/download/v0.10.0/pixiv-cli_0.10.0_linux_amd64.tar.gz"
      sha256 "94d33c22a340b20d5c2dd3cb43d253e4f5c125a65383029e81a50f272f6d83ba"
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
    version_info = JSON.parse(shell_output("#{bin}/pixiv version --json"))
    assert_equal "v#{version}", version_info["version"]
  end
end
