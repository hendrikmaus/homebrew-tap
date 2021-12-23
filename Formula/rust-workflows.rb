class RustWorkflows < Formula
  desc "Reference project for GitHub Action workflows to use on Rust projects"
  homepage "https://github.com/hendrikmaus/rust-workflows"
  url "https://github.com/hendrikmaus/rust-workflows/archive/refs/tags/v0.3.1.tar.gz"
  sha256 "c29c863677871ea91d3f2df58a618d95bbb260dd6ca254027760a9cf9bb795c6"
  license "MIT"
  revision 1

  livecheck do
    url :stable
    strategy :github_latest
  end

  bottle do
    root_url "https://github.com/hendrikmaus/homebrew-tap/releases/download/rust-workflows-0.3.1_1"
    sha256 cellar: :any_skip_relocation, big_sur:      "050151fb4d61a0526cefb0e908c147126134562d487f8714c2fddb93c02e7a52"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "d6629df495ea8fc792f55e7e0915ff297b21f717f058c8ff49f4cd89fac33294"
  end

  head do
    url "https://github.com/hendrikmaus/rust-workflows.git", branch: "master"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "#{bin}/rust-workflows"
  end
end
