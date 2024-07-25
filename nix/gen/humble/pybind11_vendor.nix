{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  git,
  python3Packages,
  substituteSource,
}:
let
  sources = rec {
    pybind11_vendor = substituteSource {
      src = fetchgit {
        name = "pybind11_vendor-source";
        url = "https://github.com/ros2-gbp/pybind11_vendor-release.git";
        rev = "dc70c591e023aaf6e9da9f193dce726004555fa4";
        hash = "sha256-cT3uRbcmI/lPhd01+fp3uBdAtMhNu4rZB9UMmr+g5z4=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "GIT_REPOSITORY https://github.com/pybind/pybind11.git";
          to = "URL ${pybind11_vendor-vendor_source-pybind11-0}";
        }
      ];
    };
    pybind11_vendor-vendor_source-pybind11-0 = substituteSource {
      src = fetchgit {
        name = "pybind11_vendor-vendor_source-pybind11-0-source";
        url = "https://github.com/pybind/pybind11.git";
        rev = "ffa346860b306c9bbfb341aed9c14c067751feb8";
        hash = "sha256-wBvEWQlZhHoSCMbGgYtB3alWBLA8mA8Mz6JPLhXa3Pc=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "pybind11_vendor";
  version = "2.4.2-1";
  src = sources.pybind11_vendor;
  nativeBuildInputs = [ ament_cmake git ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ python3Packages.pybind11 ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
