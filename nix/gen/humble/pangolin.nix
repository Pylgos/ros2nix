{
  buildRosPackage,
  cmake,
  eigen,
  fetchgit,
  fetchurl,
  fetchzip,
  glew,
  libjpeg_turbo,
  libpng,
  python3,
  substituteSource,
}:
let
  sources = rec {
    pangolin = substituteSource {
      src = fetchgit {
        name = "pangolin-source";
        url = "https://github.com/ros2-gbp/Pangolin-release.git";
        rev = "71783d8f4732824a7cb32186092886d28a378552";
        hash = "sha256-VAE6VKDuVagjFsw1q6X/hpGUYbDSIx+Os9F+/76bo08=";
      };
      substitutions = [
        {
          path = "scripts/vcpkg/ports/qca/portfile.cmake";
          from = "DOWNLOAD https://raw.githubusercontent.com/mozilla/gecko-dev/master/security/nss/lib/ckfw/builtins/certdata.txt";
          to = "DOWNLOAD file://${pangolin-vendor_source-certdata-0}";
        }
      ];
    };
    pangolin-vendor_source-certdata-0 = substituteSource {
      src = fetchurl {
        name = "pangolin-vendor_source-certdata-0-source";
        url = "https://raw.githubusercontent.com/mozilla/gecko-dev/master/security/nss/lib/ckfw/builtins/certdata.txt";
        hash = "sha256-RW/wld3m3XM1TFwoxz2cBvU7YagDljQUy5Gh2SlFzdM=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "pangolin";
  version = "0.9.1-1";
  src = sources.pangolin;
  nativeBuildInputs = [ cmake ];
  propagatedNativeBuildInputs = [ python3 ];
  buildInputs = [  ];
  propagatedBuildInputs = [ eigen glew libjpeg_turbo libpng ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
