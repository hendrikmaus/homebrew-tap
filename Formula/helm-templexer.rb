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
    root_url "https://github.com/hendrikmaus/homebrew-tap/releases/download/helm-templexer-2.0.0_1"
    sha256 cellar: :any_skip_relocation, catalina:     "bc70c85aba76810d25ca17847b4fd1093c0d20bcfa258680c0e4b8ba43306eea"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "98de6da2608a9f93047db02a366239f010b54642f58fe1c0629b1a98dddf5060"
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
