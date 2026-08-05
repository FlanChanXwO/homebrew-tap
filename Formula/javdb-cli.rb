class JavdbCli < Formula
  desc "Unofficial JavDB app API command-line client"
  homepage "https://github.com/FlanChanXwO/javdb-cli"
  version "0.4.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/FlanChanXwO/javdb-cli/releases/download/v0.4.0/javdb-cli_0.4.0_darwin_arm64.tar.gz"
      sha256 "984a57a35edb1ff4ddca7d48dd58effc5ffa816bae415f01566549666e43c25b"
    else
      url "https://github.com/FlanChanXwO/javdb-cli/releases/download/v0.4.0/javdb-cli_0.4.0_darwin_amd64.tar.gz"
      sha256 "de16dceb4c810ba60e5a4fc4afe56abff2472a1ac4a043c84ac0bdb32a0bb165"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/FlanChanXwO/javdb-cli/releases/download/v0.4.0/javdb-cli_0.4.0_linux_arm64.tar.gz"
      sha256 "1df69692fc6e504df012c00c2e6e67813275fe212bd3a75da662f0a8407c7fd0"
    else
      url "https://github.com/FlanChanXwO/javdb-cli/releases/download/v0.4.0/javdb-cli_0.4.0_linux_amd64.tar.gz"
      sha256 "cada64adaff2aa16298c54610665b76b326d760dadaa52144c0f4404c55110d6"
    end
  end

  def install
    bin.install "javdb"
  end

  test do
    version_info = JSON.parse(shell_output("#{bin}/javdb version --json"))
    assert_equal "v#{version}", version_info["version"]
  end
end
