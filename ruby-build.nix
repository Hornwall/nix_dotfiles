{ stdenv, fetchFromGitHub, bash }:
stdenv.mkDerivation {
  name = "ruby-build"

  src = fetchFromGithub {
    owner = "rbenv";
    repo =  "ruby-build";
    rev = "20220726";
    sha256 = "12i050vs35iiblxga43zrj7xwbaisv3mq55y9ikagkr8pj1vmq53"
  };

  buildPhase = '''';

  installPhase = ''
    mkdir -p "$(rbenv root)"/plugins
    cp -r * "$(rbenv root)"/plugins/ruby-build
  '';
}
