{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  git,
  nlohmann_json,
  pybind11_vendor,
  substituteSource,
}:
let
  sources = rec {
    pybind11_json_vendor = substituteSource {
      src = fetchgit {
        name = "pybind11_json_vendor-source";
        url = "https://github.com/ros2-gbp/pybind11_json_vendor-release.git";
        rev = "c2a4dd0f4574c76eaaefad452f910a782afe71ce";
        hash = "sha256-apExg4+M6vibeYoGyc6lyiC84/HLeog/rSz1tbrwmbE=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "GIT_REPOSITORY https://github.com/pybind/pybind11_json.git";
          to = "URL ${pybind11_json_vendor-vendor_source-pybind11_json-0}";
        }
      ];
    };
    pybind11_json_vendor-vendor_source-pybind11_json-0 = substituteSource {
      src = fetchgit {
        name = "pybind11_json_vendor-vendor_source-pybind11_json-0-source";
        url = "https://github.com/pybind/pybind11_json.git";
        rev = "0fbbe3bbb27bd07a5ec7d71cbb1f17eaf4d37702";
        hash = "sha256-GQldzT1YU6I1s1RFfzNIJNaIY/LsrsTevoaUoz1SK+Y=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "pybind11_json_vendor";
  version = "0.3.1-1";
  src = sources.pybind11_json_vendor;
  nativeBuildInputs = [ ament_cmake git ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ nlohmann_json pybind11_vendor ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
