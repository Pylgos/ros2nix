{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  git,
  substituteSource,
}:
let
  sources = rec {
    fmilibrary_vendor = substituteSource {
      src = fetchgit {
        name = "fmilibrary_vendor-source";
        url = "https://github.com/ros2-gbp/fmilibrary_vendor-release.git";
        rev = "08f471024647d9a20a30699b327405315a202768";
        hash = "sha256-RwFS1j6Bue1ac96cXWL4i1A+KcMFWctqGRc0ZGeTR70=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "GIT_REPOSITORY https://github.com/modelon-community/fmi-library.git";
          to = "URL ${fmilibrary_vendor-vendor_source-fmi-library-0}";
        }
      ];
    };
    fmilibrary_vendor-vendor_source-fmi-library-0 = substituteSource {
      src = fetchgit {
        name = "fmilibrary_vendor-vendor_source-fmi-library-0-source";
        url = "https://github.com/modelon-community/fmi-library.git";
        rev = "998768cddacce99727d633d045fa6d25314e1d9a";
        hash = "sha256-i8EtjPMg39S/3RyoUaXm5A8Nu/NbgAwjxRCdyh2elyU=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "fmilibrary_vendor";
  version = "1.0.1-4";
  src = sources.fmilibrary_vendor;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ git ];
  buildInputs = [  ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}