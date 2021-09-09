class HelmTemplexer < Formula
  desc "Render Helm charts for multiple environments using explicit configuration"
  homepage "https://github.com/hendrikmaus/helm-templexer"
  url "https://github.com/hendrikmaus/helm-templexer/archive/refs/tags/2.0.0.tar.gz"
  sha256 "52fdb2c2becba7489a2713cfb966b453d6bae94b16c9ba79209688cfe5ce0318"
  license "MIT"
  revision 1

  livecheck do
    url :stable
    strategy :github_latest
  end

  bottle do
    root_url "https://github.com/hendrikmaus/homebrew-tap/releases/download/helm-templexer-1.0.0_1"
    sha256 cellar: :any_skip_relocation, catalina:     "6b613d3678639181da0a44553212f7f4405b6bef1d3c49cedfe7d1e82f91402c"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "931c02ba070980c82a2bc52c7c1fff84a08acffa88448f441938256eb96fc7ad"
  end

  head do
    url "https://github.com/hendrikmaus/helm-templexer.git"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "helm-templexer", shell_output("#{bin}/helm-templexer help")
  end
end
