class PixivCli < Formula
  desc "Pixiv command-line client and MCP server"
  homepage "https://github.com/FlanChanXwO/pixiv-cli"
  version "1.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/FlanChanXwO/pixiv-cli/releases/download/v1.1.0/pixiv-cli_1.1.0_darwin_arm64.tar.gz"
      sha256 "644447fc00160307c1d42e50408634f854f558f82343e68d17c401ab4a93b299"
    else
      url "https://github.com/FlanChanXwO/pixiv-cli/releases/download/v1.1.0/pixiv-cli_1.1.0_darwin_amd64.tar.gz"
      sha256 "7e868df1eeb6e4cdc6ed079a1bdc481cce08ef984e2a4dadf7029f7e6e87ac4f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/FlanChanXwO/pixiv-cli/releases/download/v1.1.0/pixiv-cli_1.1.0_linux_arm64.tar.gz"
      sha256 "3c2698b50e1146196d9c2f84bb4f752b7ba652227c640d2a37650344d34cfd8e"
    else
      url "https://github.com/FlanChanXwO/pixiv-cli/releases/download/v1.1.0/pixiv-cli_1.1.0_linux_amd64.tar.gz"
      sha256 "bad6243883ad3b8e0563559749dac53ab025cdb9bf3cb150632cb23f318a16e0"
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
