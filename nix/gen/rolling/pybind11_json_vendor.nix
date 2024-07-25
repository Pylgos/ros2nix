{
  ament_cmake,
  ament_cmake_vendor_package,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
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
        rev = "fb32bb1d43d2b20a025fabcbf0fe1b598a8b27b6";
        hash = "sha256-sBIr8Vv+i2uqAcyEryqSVaPBzxg4WqowzHzeFh1WKgk=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "VCS_URL https://github.com/pybind/pybind11_json.git";
          to = "VCS_TYPE path VCS_URL ${pybind11_json_vendor-vendor_source-pybind11_json-0}";
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
  version = "0.5.0-1";
  src = sources.pybind11_json_vendor;
  nativeBuildInputs = [ ament_cmake ament_cmake_vendor_package ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ nlohmann_json pybind11_vendor ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}