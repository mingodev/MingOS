{ stdenvNoCC, fetchFromGitHub, libsForQt5 }:
stdenvNoCC.mkDerivation rec {
  pname = "sddm-chili";
  version = "0.1.5";
  src = fetchFromGitHub {
    owner = "MarianArlt";
    repo = "sddm-chili";
    rev = version;
    sha256 = "036fxsa7m8ymmp3p40z671z163y6fcsa9a641lrxdrw225ssq5f3";
  };
  propagatedUserEnvPkgs = [ libsForQt5.qtgraphicaleffects ];
  dontBuild = true;
  installPhase = ''
    mkdir -p $out/share/sddm/themes
    cp -aR $src $out/share/sddm/themes/sddm-chili
  '';
}
