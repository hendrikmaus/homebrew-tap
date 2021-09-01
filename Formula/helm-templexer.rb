class HelmTemplexer < Formula
  desc "Render Helm charts for multiple environments using explicit configuration"
  homepage "https://github.com/hendrikmaus/helm-templexer"
  url "https://github.com/hendrikmaus/helm-templexer/archive/refs/tags/1.0.0.tar.gz"
  sha256 "b2f9e57b4d49d6f3aec7d9bdcf015efa7d0e869f9b80581c75f6b128235d3a94"
  license "MIT"
  revision 1

  livecheck do
    url :stable
    strategy :github_latest
  end

  bottle do
    root_url "https://github.com/hendrikmaus/homebrew-tap/releases/download/helm-templexer-0.3.0_1"
    sha256 cellar: :any_skip_relocation, catalina:     "e47f2bc025bd1596a4a20801ece0f798b95e272166ad3e4d352a148d7facaa6d"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "19b986608135ed2b78ecd25da6e51e892f0a8c4e4398f34ea0b295c52e1cb529"
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
