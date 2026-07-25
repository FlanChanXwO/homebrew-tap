class PixivCli < Formula
  desc "Pixiv command-line client and MCP server"
  homepage "https://github.com/FlanChanXwO/pixiv-cli"
  version "0.7.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/FlanChanXwO/pixiv-cli/releases/download/v0.7.2/pixiv-cli_0.7.2_darwin_arm64.tar.gz"
      sha256 "96805d2c2b435292acef6a7c7f911103b72b4efea6eccaaeb5cdaa90d0cec0f1"
    else
      url "https://github.com/FlanChanXwO/pixiv-cli/releases/download/v0.7.2/pixiv-cli_0.7.2_darwin_amd64.tar.gz"
      sha256 "2b30ead9146528bdecb397290c0ad1789cc814803237289d08b696dc861e7412"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/FlanChanXwO/pixiv-cli/releases/download/v0.7.2/pixiv-cli_0.7.2_linux_arm64.tar.gz"
      sha256 "750accf4e424f6bcf87c5d759610ebcf24711dd89d85b2cbeb06dac23b2ab71b"
    else
      url "https://github.com/FlanChanXwO/pixiv-cli/releases/download/v0.7.2/pixiv-cli_0.7.2_linux_amd64.tar.gz"
      sha256 "7901c02ad66e6eb65ec11bbe22af0f09ee07c979d3498a94b643f79dc9b87948"
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
